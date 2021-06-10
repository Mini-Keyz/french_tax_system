# frozen_string_literal: true

require "date"
require_relative "french_tax_system/version"
require_relative "nue_formulas"
require_relative "lmnp_formulas"

module FrenchTaxSystem
  extend self
  class Error < StandardError; end

  # Constants
  INCOME_TAXES_SCALE = {
    year2021: [
      { family_quotient_amount: { start_scale: 0, end_scale: 10_084 }, tax: 0 },
      { family_quotient_amount: { start_scale: 10_085, end_scale: 25_710 }, tax: 0.11 },
      { family_quotient_amount: { start_scale: 25_711, end_scale: 73_516 }, tax: 0.3 },
      { family_quotient_amount: { start_scale: 73_517, end_scale: 158_122 }, tax: 0.41 },
      { family_quotient_amount: { start_scale: 158_123, end_scale: Float::INFINITY }, tax: 0.45 }
    ]
  }.freeze

  FISCAL_NB_PARTS_FOR_MARRIED_COUPLE = 2
  FISCAL_NB_PARTS_FOR_SINGLE_PERSON = 1

  FAMILY_QUOTIENT_CAPPING_AMOUNT = {
    ## Per half fiscal parts for children
    year2021: {
      married_household: {
        half_part: 1570
      },
      single_person_household: {
        marked_up_half_part: 1852,
        half_part: 1570
      }
    }
  }.freeze

  DISCOUNT_ON_LOW_INCOME_TAX = {
    year2021: {
      discount_percentage: 0.4525,
      threshold_single_person_household: 1722,
      lump_sum_single_person_household: 779,
      threshold_married_couple_household: 2849,
      lump_sum_married_couple_household: 1289
    }
  }.freeze

  REVENUES_STANDARD_ALLOWANCE = 0.1

  REAL_REGIMEN_DEDUCTIBLE_EXPENSES = {
    fiscal_year1: %w[house_first_works_amount house_landlord_charges_amount_per_year
                     house_property_management_amount_per_year house_insurance_gli_amount_per_year house_insurance_pno_amount_per_year house_property_tax_amount_per_year credit_loan_cumulative_interests_paid_for_year_two credit_loan_insurance_amount_per_year],
    fiscal_year2: %w[house_landlord_charges_amount_per_year
                     house_property_management_amount_per_year house_insurance_gli_amount_per_year house_insurance_pno_amount_per_year house_property_tax_amount_per_year credit_loan_cumulative_interests_paid_for_year_two credit_loan_insurance_amount_per_year]
  }.freeze

  SOCIAL_CONTRIBUTIONS_PERCENTAGE = 0.172

  # Methods

  # Calculate the income tax to pay with or without the generated income from the property investment
  # TO UPDATE
  # @params [Hash] simulation a simulation created by Mini-Keyz app
  # @options simulation [Integer] :house_price_bought_amount how much was the house bought (euros)
  # @options simulation [Integer] :house_first_works_amount how much were the first works realized (euros)
  # @options simulation [Integer] :house_landlord_charges_amount_per_year how much are the landlord charges (euros/year)
  # @options simulation [Integer] :house_property_tax_amount_per_year how much is the property tax (euros/year)
  # @options simulation [Integer] :house_rent_amount_per_month how much is the rent paid by the tenant (euros/month)
  # @options simulation [Integer] :house_rent_amount_per_year how much is the rent paid by the tenant (euros/year)
  # @options simulation [Integer] :house_property_management_amount_per_year how much is property management cost (euros/year)
  # @options simulation [Integer] :credit_loan_amount how much is credit loan amount (euros)
  # @options simulation [Integer] :credit_loan_duration how long is the credit (years)
  # @options simulation [String] :fiscal_status what fiscal status has been chosen
  # @options simulation [String] :fiscal_regimen what fiscal regimen has been chosen
  # @options simulation [Integer] :fiscal_revenues_p1 salary from person 1 of the fiscal household (euros)
  # @options simulation [Integer] :fiscal_revenues_p2 salary from person 2 of the fiscal household (euros)
  # @options simulation [String] :fiscal_marital_status fiscal relation between the 'parents' of the household
  # @options simulation [Integer] :fiscal_nb_dependent_children number of dependent children of fiscal household
  # @options simulation [Integer] :fiscal_nb_alternate_custody_children number of alternate custody children of fiscal household
  # @params [String] investment_fiscal_year indicates if the calculation is made with or without the property income
  #
  # @return [Float] the final income tax to pay (euros)

  def calc_taxes_amount_per_year(simulation, calculation_method, investment_top_fiscal_year)
    # Iterate over investment first to top fiscal year and return an array which concatenates all hashes generated per fiscal year
    income_tax_array = (1..investment_top_fiscal_year).map.with_index do |investment_fiscal_year, index|
      ## Set postponed neg tax p income to 0 for the first year and to previous year result for other years
      if investment_fiscal_year == 1
        postponed_negative_taxable_property_income_from_previous_fiscal_year = 0
      elsif investment_fiscal_year >= 2
        postponed_negative_taxable_property_income_from_previous_fiscal_year = income_tax_array[index - 1][:income_tax][:negative_taxable_property_income_amount_to_postpone]
      end

      ## Calculate income tax params for this fiscal_year
      income_tax_params = calc_income_tax_amount_for_year(simulation, calculation_method, postponed_negative_taxable_property_income_from_previous_fiscal_year, investment_fiscal_year)

      ## Calculate social contributions for this fiscal year
      social_contributions_amount = calc_social_contributions_amount_for_year(simulation, postponed_negative_taxable_property_income_from_previous_fiscal_year, investment_fiscal_year)

      ## Return a nice big chunky hash
      {
        income_tax: income_tax_params,
        social_contributions_amount: social_contributions_amount
      }
    end
  end

  def calc_income_tax_amount_for_year(simulation, calculation_method, postponed_negative_taxable_property_income_from_previous_fiscal_year, investment_fiscal_year)
    # Calculate net taxable property income and global net taxable income
    case calculation_method
    when "with_property_income"
      net_taxable_property_income_amount = calc_net_taxable_property_income_amount(simulation, postponed_negative_taxable_property_income_from_previous_fiscal_year, investment_fiscal_year)
      global_net_taxable_income_amount = calc_global_net_taxable_amount(simulation,
                                                                        net_taxable_property_income_amount[:net_taxable_property_income_amount])
    when "without_property_income"
      global_net_taxable_income_amount = calc_global_net_taxable_amount(simulation,
                                                                        0)
    else
      raise ArgumentError, "Not a valid argument, it should be 'with_property_income' or 'without_property_income'"
    end

    # Calculate the number of fiscal parts
    fiscal_nb_parts = calc_fiscal_nb_parts(simulation)
    fiscal_nb_parts_for_capping = simulation[:fiscal_marital_status] == "Célibataire" ? FISCAL_NB_PARTS_FOR_SINGLE_PERSON : FISCAL_NB_PARTS_FOR_MARRIED_COUPLE

    # Calculate the family quotient amount
    family_quotient_amount_real_fiscal_parts = calc_family_quotient_amount(global_net_taxable_income_amount,
                                                                           fiscal_nb_parts)
    family_quotient_amount_for_fiscal_parts_capping = calc_family_quotient_amount(global_net_taxable_income_amount,
                                                                                  fiscal_nb_parts_for_capping)

    # Calculcate the aggregated tax amount
    current_year = Date.today.year
    aggregated_tax_amount_real_fiscal_parts = calc_aggregated_tax_amount(family_quotient_amount_real_fiscal_parts,
                                                                         current_year)
    aggregated_tax_amount_for_fiscal_parts_capping = calc_aggregated_tax_amount(
      family_quotient_amount_for_fiscal_parts_capping, current_year
    )

    # Calculcate previsional income tax
    capping_due_to_fiscal_parts = calc_capping_due_to_fiscal_parts(simulation, fiscal_nb_parts,
                                                                   current_year)
    not_capped_income_tax = (aggregated_tax_amount_real_fiscal_parts * fiscal_nb_parts).round
    capped_income_tax = (aggregated_tax_amount_for_fiscal_parts_capping * fiscal_nb_parts_for_capping).round - capping_due_to_fiscal_parts

    # Get the highest possible income tax amount
    almost_final_income_tax = [not_capped_income_tax, capped_income_tax].max

    # Apply discount on low income tax if necessary
    final_income_tax = apply_discount_on_low_income_tax(simulation, almost_final_income_tax, current_year)

    # Return a hash of values
    {
      global_net_taxable_income_amount: global_net_taxable_income_amount,
      net_taxable_property_income_amount: calculation_method == "with_property_income" ? net_taxable_property_income_amount[:net_taxable_property_income_amount] : 0,
      negative_taxable_property_income?: calculation_method == "with_property_income" ? net_taxable_property_income_amount[:negative_taxable_property_income?] : false,
      negative_taxable_property_income_amount_to_postpone: calculation_method == "with_property_income" ? net_taxable_property_income_amount[:negative_taxable_property_income_amount_to_postpone] : 0,
      fiscal_nb_parts: fiscal_nb_parts,
      income_tax_amount: final_income_tax,
      discount_on_low_income_tax_amount: (almost_final_income_tax - final_income_tax).positive? ? almost_final_income_tax - final_income_tax : 0
    }
  end

  def calc_social_contributions_amount_for_year(simulation, postponed_negative_taxable_property_income_from_previous_fiscal_year, investment_fiscal_year)
    # Calculate net taxable property income that will be reported to French taxes
    net_taxable_property_income_amount = calc_net_taxable_property_income_amount(simulation, postponed_negative_taxable_property_income_from_previous_fiscal_year, investment_fiscal_year)

    # Return the social contributions to pay in addition to income taxes (it really never ends...)
    if net_taxable_property_income_amount <= 0
      0
    else
      net_taxable_property_income_amount * SOCIAL_CONTRIBUTIONS_PERCENTAGE
    end
  end

  def apply_discount_on_low_income_tax(simulation, almost_final_income_tax, current_year)
    if simulation[:fiscal_marital_status] == "Célibataire" && almost_final_income_tax <= DISCOUNT_ON_LOW_INCOME_TAX["year#{current_year}".to_sym][:threshold_single_person_household]
      discount_to_apply = DISCOUNT_ON_LOW_INCOME_TAX["year#{current_year}".to_sym][:lump_sum_single_person_household] - (almost_final_income_tax * DISCOUNT_ON_LOW_INCOME_TAX["year#{current_year}".to_sym][:discount_percentage])
      almost_final_income_tax - discount_to_apply
    elsif simulation[:fiscal_marital_status] == "Marié / Pacsé" && almost_final_income_tax <= DISCOUNT_ON_LOW_INCOME_TAX["year#{current_year}".to_sym][:threshold_married_couple_household]
      discount_to_apply = DISCOUNT_ON_LOW_INCOME_TAX["year#{current_year}".to_sym][:lump_sum_married_couple_household] - (almost_final_income_tax * DISCOUNT_ON_LOW_INCOME_TAX["year#{current_year}".to_sym][:discount_percentage])
      almost_final_income_tax - discount_to_apply
    else
      almost_final_income_tax
    end
  end

  def calc_capping_due_to_fiscal_parts(simulation, fiscal_nb_parts, current_year)
    case simulation[:fiscal_marital_status]
    when "Marié / Pacsé"
      (fiscal_nb_parts - FISCAL_NB_PARTS_FOR_MARRIED_COUPLE) * FAMILY_QUOTIENT_CAPPING_AMOUNT["year#{current_year}".to_sym][:married_household][:half_part] * 2
    when "Célibataire"
      if simulation[:fiscal_nb_dependent_children] == 0 && simulation[:fiscal_nb_alternate_custody_children] == 0
        0
      elsif simulation[:fiscal_nb_dependent_children] >= 1 || simulation[:fiscal_nb_alternate_custody_children] >= 2
        # First part is marked-up for single parent, and then normal calculation
        FAMILY_QUOTIENT_CAPPING_AMOUNT["year#{current_year}".to_sym][:single_person_household][:marked_up_half_part] * 2 +
          (fiscal_nb_parts - 1 - FISCAL_NB_PARTS_FOR_SINGLE_PERSON) * FAMILY_QUOTIENT_CAPPING_AMOUNT["year#{current_year}".to_sym][:single_person_household][:half_part] * 2
      elsif simulation[:fiscal_nb_alternate_custody_children] == 1 && simulation[:fiscal_nb_dependent_children] == 0
        # First part is marked-up for single parent, and then normal calculation
        FAMILY_QUOTIENT_CAPPING_AMOUNT["year#{current_year}".to_sym][:single_person_household][:marked_up_half_part]
      end
    end
  end

  def calc_net_taxable_property_income_amount(simulation, postponed_negative_taxable_property_income_from_previous_fiscal_year, investment_fiscal_year)
    case simulation[:fiscal_status]
    when "Vide"
      NueFormulas.calc_net_taxable_property_income_amount(simulation, postponed_negative_taxable_property_income_from_previous_fiscal_year, investment_fiscal_year)
    when "LMNP"
      LmnpFormulas.calc_net_taxable_property_income_amount(simulation, postponed_negative_taxable_property_income_from_previous_fiscal_year, investment_fiscal_year)
    end
  end

  def calc_global_net_taxable_amount(simulation, net_taxable_property_income_amount)
    ((simulation[:fiscal_revenues_p1] + (simulation.key?(:fiscal_revenues_p2) ? simulation[:fiscal_revenues_p2] : 0)) * (1 - REVENUES_STANDARD_ALLOWANCE)) + net_taxable_property_income_amount
  end

  def calc_fiscal_nb_parts(simulation)
    case simulation[:fiscal_marital_status]
    when "Marié / Pacsé"
      FISCAL_NB_PARTS_FOR_MARRIED_COUPLE + calc_fiscal_nb_parts_incurred_from_children(simulation)
    when "Célibataire"
      if simulation[:fiscal_nb_dependent_children] == 0 && simulation[:fiscal_nb_alternate_custody_children] == 0
        FISCAL_NB_PARTS_FOR_SINGLE_PERSON
      elsif simulation[:fiscal_nb_dependent_children] >= 1 || simulation[:fiscal_nb_alternate_custody_children] >= 2
        # +0.5 part for "parent isole" 1) with at least one dependent child OR 2) with at least two alternate custody child
        FISCAL_NB_PARTS_FOR_SINGLE_PERSON + 0.5 + calc_fiscal_nb_parts_incurred_from_children(simulation)
      elsif simulation[:fiscal_nb_alternate_custody_children] == 1 && simulation[:fiscal_nb_dependent_children] == 0
        # +0.25 part for "parent isole" with one alternate custody child but no dependent child
        FISCAL_NB_PARTS_FOR_SINGLE_PERSON + 0.25 + calc_fiscal_nb_parts_incurred_from_children(simulation)
      end
    end
  end

  def calc_fiscal_nb_parts_incurred_from_children(simulation)
    # Detail of calculation method in GitHub wiki: https://github.com/Mth0158/mini-keyz/wiki/French-tax-system
    total_nb_children = simulation[:fiscal_nb_dependent_children] + simulation[:fiscal_nb_alternate_custody_children]

    if total_nb_children <= 2
      0.5 * simulation[:fiscal_nb_dependent_children] + 0.25 * simulation[:fiscal_nb_alternate_custody_children]

    elsif total_nb_children >= 3

      if simulation[:fiscal_nb_dependent_children] == 0
        0.5 + (simulation[:fiscal_nb_alternate_custody_children] - 2) * 0.5

      elsif simulation[:fiscal_nb_dependent_children] == 1
        if simulation[:fiscal_nb_alternate_custody_children] == 2
          1.25
        elsif simulation[:fiscal_nb_alternate_custody_children] >= 3
          1.25 + (simulation[:fiscal_nb_alternate_custody_children] - 2) * 0.5
        end

      elsif simulation[:fiscal_nb_dependent_children] == 2
        1 + simulation[:fiscal_nb_alternate_custody_children] * 0.5

      elsif simulation[:fiscal_nb_dependent_children] >= 3
        1 + (simulation[:fiscal_nb_dependent_children] - 2) + simulation[:fiscal_nb_alternate_custody_children] * 0.5
      end
    end
  end

  def calc_family_quotient_amount(global_net_taxable_income_amount, fiscal_nb_parts)
    global_net_taxable_income_amount / fiscal_nb_parts
  end

  def calc_aggregated_tax_amount(family_quotient_amount, current_year)
    income_taxes_scale = INCOME_TAXES_SCALE["year#{current_year}".to_sym]

    income_taxes_scale.map do |scale|
      if family_quotient_amount < scale[:family_quotient_amount][:start_scale]
        0
      elsif family_quotient_amount >= scale[:family_quotient_amount][:start_scale] && family_quotient_amount < scale[:family_quotient_amount][:end_scale]
        (family_quotient_amount - scale[:family_quotient_amount][:start_scale]) * scale[:tax]
      elsif family_quotient_amount >= scale[:family_quotient_amount][:end_scale]
        (scale[:family_quotient_amount][:end_scale] - scale[:family_quotient_amount][:start_scale]) * scale[:tax]
      end
    end.sum
  end

  def calc_income_taxes_scale(simulation, calculation_method, investment_fiscal_year)
    case calculation_method
    when "with_property_income"
      net_taxable_property_income_amount = calc_net_taxable_property_income_amount(simulation, investment_fiscal_year)
      global_net_taxable_income_amount = calc_global_net_taxable_amount(simulation,
                                                                        net_taxable_property_income_amount)
    when "without_property_income"
      global_net_taxable_income_amount = calc_global_net_taxable_amount(simulation, 0)
    else
      raise ArgumentError, "Not a valid argument, it should be 'with_property_income' or 'without_property_income'"
    end

    fiscal_nb_parts = calc_fiscal_nb_parts(simulation)

    family_quotient_amount = calc_family_quotient_amount(global_net_taxable_income_amount, fiscal_nb_parts)
    current_year = Date.today.year

    income_taxes_scale = INCOME_TAXES_SCALE["year#{current_year}".to_sym]

    income_taxes_scale.find { |scale| family_quotient_amount <= scale[:family_quotient_amount][:end_scale] }
  end
end
