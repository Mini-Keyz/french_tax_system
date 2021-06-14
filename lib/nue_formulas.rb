# frozen_string_literal: true

module FrenchTaxSystem
  module NueFormulas
    extend self

    # Constants
    PROPERTY_INCOME_STANDARD_ALLOWANCE = 0.3
    CAPPED_NEGATIVE_NET_TAXABLE_INCOME_AMOUNT = 10_700

    # Methods
    # Calculate the net taxable income generated from the property investment
    #
    # @params [Hash] simulation a simulation created by Mini-Keyz app
    # @options simulation [Integer] :house_rent_amount_per_year how much is the rent paid by the tenant (euros/year)
    # @options simulation [Integer] :house_first_works_amount how much were the first works realized (euros)
    # @options simulation [Integer] :house_landlord_charges_amount_per_year how much are the landlord charges (euros/year)
    # @options simulation [Float] :house_property_management_amount_per_year how much is property management cost (euros/year)
    # @options simulation [Integer] :house_insurance_gli_amount_per_year how much is gli insurance cost (euros/year)
    # @options simulation [Integer] :house_insurance_pno_amount_per_year how much is pno insurance cost (euros/year)
    # @options simulation [Integer] :house_property_tax_amount_per_year how much is the property tax (euros/year)
    # @options simulation [Float] :credit_loan_cumulative_interests_paid_for_year_two how much is the credit interest cost for year 2 (euros/year)
    # @options simulation [Float] :credit_loan_insurance_amount_per_year how much is the credit insurance cost (euros/year)
    # @options simulation [String] :fiscal_regimen what fiscal regimen has been chosen
    # @params [Integer] investment_fiscal_year indicates the investment fiscal year on which the calculation is made
    #
    # @return [Hash] fiscal_year* the corresponding year * as requested in @params
    # @options fiscal_year* [Float] :net_taxable_property_income_amount the taxable income generated from the property investment to add to the global taxable income
    # @options fiscal_year* [Boolean] :negative_taxable_property_income?  are we doing a taxable income reduction thks to our property investment
    # @options fiscal_year* [Integer] :negative_taxable_property_income_amount_to_postpone negative taxable property income amount to postpone to the next fiscal year
    def calc_net_taxable_property_income_amount(simulation, postponed_negative_taxable_property_income_from_previous_fiscal_year, investment_fiscal_year)
      # Calculate net taxable property income amount thks to fiscal regimen
      case simulation[:fiscal_regimen]
      when "Forfait"
        calc_flat_rate_regimen_net_taxable_property_income_amount(simulation)
      when "Réel"
        calc_deductible_expenses_regimen_net_taxable_property_income_amount(simulation, postponed_negative_taxable_property_income_from_previous_fiscal_year, investment_fiscal_year)
      end
    end

    # Calculate net taxable property income for 'Forfait' fiscal_regimen
    #
    # @params [Hash] simulation a simulation created by Mini-Keyz app
    # @options simulation [Float] :house_rent_amount_per_year the income generated per year (euros)
    #
    # @return [Hash] a hash made of the net taxable property income (euros) and other values
    # @options hash [Float] :net_taxable_property_income_amount the net taxable property income generated from the investment (euros)
    # @options hash [Boolean] :negative_taxable_property_income? returns true or false if there is a negative taxable property income for this fiscal year
    # @options hash [Float] :negative_taxable_property_income_amount_to_postpone the potential negative taxable property income to postpone to the next fiscal year (euros)
    def calc_flat_rate_regimen_net_taxable_property_income_amount(simulation)
      net_taxable_property_income_amount = simulation[:house_rent_amount_per_year] * (1 - PROPERTY_INCOME_STANDARD_ALLOWANCE)
      {
        net_taxable_property_income_amount: net_taxable_property_income_amount,
        negative_taxable_property_income?: false,
        negative_taxable_property_income_amount_to_postpone: 0
      }
    end

    # Calculate net taxable property income for 'Reel' fiscal_regimen
    #
    # @params [Hash] simulation a simulation created by Mini-Keyz app
    # @options simulation [Float] :house_rent_amount_per_year the income generated per year (euros)
    # @options simulation [Integer] :house_first_works_amount how much were the first works realized (euros)
    # @options simulation [Integer] :house_landlord_charges_amount_per_year how much are the landlord charges (euros/year)
    # @options simulation [Float] :house_property_management_amount_per_year how much is property management cost (euros/year)
    # @options simulation [Integer] :house_insurance_gli_amount_per_year how much is gli insurance cost (euros/year)
    # @options simulation [Integer] :house_insurance_pno_amount_per_year how much is pno insurance cost (euros/year)
    # @options simulation [Integer] :house_property_tax_amount_per_year how much is the property tax (euros/year)
    # @options simulation [Float] :credit_loan_cumulative_interests_paid_for_year_two how much is the credit interest cost for year 2 (euros/year)
    # @options simulation [Float] :credit_loan_insurance_amount_per_year how much is the credit insurance cost (euros/year)
    # @params [Integer] investment_fiscal_year indicates the investment fiscal year on which the calculation is made
    # @params [Integer] postponed_negative_taxable_property_income_from_previous_fiscal_year the potentiel negative taxable income from the previous fiscal year
    #
    # @return [Hash] a hash made of the net taxable property income (euros) and other values
    # @options hash [Float] :net_taxable_property_income_amount the net taxable property income generated from the investment (euros)
    # @options hash [Boolean] :negative_taxable_property_income? returns true or false if there is a negative taxable property income for this fiscal year
    # @options hash [Float] :negative_taxable_property_income_amount_to_postpone the potential negative taxable property income to postpone to the next fiscal year (euros)
    def calc_deductible_expenses_regimen_net_taxable_property_income_amount(simulation, postponed_negative_taxable_property_income_from_previous_fiscal_year, investment_fiscal_year)
      # Calculate deductible expenses from this fiscal year
      deductible_expenses = calc_deductible_expenses_sum(simulation, investment_fiscal_year)

      # Calculate gross taxable property income amount depending on fiscal year and with postponed negative taxable property income from previous fiscal year
      gross_taxable_property_income_amount = calc_gross_taxable_property_income_amount(simulation, deductible_expenses, postponed_negative_taxable_property_income_from_previous_fiscal_year)

      if gross_taxable_property_income_amount >= 0
        # Return a hash with corresponding values
        {
          net_taxable_property_income_amount: gross_taxable_property_income_amount,
          negative_taxable_property_income?: false,
          negative_taxable_property_income_amount_to_postpone: 0
        }
      elsif gross_taxable_property_income_amount.negative?
        # Cap negativity of net taxable amount and postpone negative taxable if remaining
        calc_taxable_property_income_repartition(simulation, gross_taxable_property_income_amount)
      end
    end

    # Calculate the gross taxable property income amount
    #
    # @params [Hash] simulation a simulation created by Mini-Keyz app
    # @options simulation [Float] :house_rent_amount_per_year the income generated per year (euros)
    # @parans [Float] :deductible_expenses the sum of deductible expenses (euros)
    # @params [Integer] postponed_negative_taxable_property_income_from_previous_fiscal_year the potentiel negative taxable income from the previous fiscal year
    #
    # @return [Float] the gross taxable property income amount
    def calc_gross_taxable_property_income_amount(simulation, deductible_expenses, postponed_negative_taxable_property_income_from_previous_fiscal_year)
      simulation[:house_rent_amount_per_year] - deductible_expenses - postponed_negative_taxable_property_income_from_previous_fiscal_year
    end

    # Calculate the sum of deductible expenses for this fiscal year
    #
    # @params [Hash] simulation a simulation created by Mini-Keyz app
    # @options simulation [Integer] :house_first_works_amount how much were the first works realized (euros)
    # @options simulation [Integer] :house_landlord_charges_amount_per_year how much are the landlord charges (euros/year)
    # @options simulation [Float] :house_property_management_amount_per_year how much is property management cost (euros/year)
    # @options simulation [Integer] :house_insurance_gli_amount_per_year how much is gli insurance cost (euros/year)
    # @options simulation [Integer] :house_insurance_pno_amount_per_year how much is pno insurance cost (euros/year)
    # @options simulation [Integer] :house_property_tax_amount_per_year how much is the property tax (euros/year)
    # @options simulation [Float] :credit_loan_cumulative_interests_paid_for_year_two how much is the credit interest cost for year 2 (euros/year)
    # @options simulation [Float] :credit_loan_insurance_amount_per_year how much is the credit insurance cost (euros/year)
    # @params [Integer] investment_fiscal_year indicates the investment fiscal year on which the calculation is made
    #
    # @return [Float] the sum of deductible expenses for this fiscal year
    def calc_deductible_expenses_sum(simulation, investment_fiscal_year)
      if investment_fiscal_year == 1
        FrenchTaxSystem::REAL_REGIMEN_DEDUCTIBLE_EXPENSES[:fiscal_year1].map do |expense|
          simulation.key?(expense.to_sym) ? simulation[expense.to_sym] : 0
        end.sum
      elsif investment_fiscal_year >= 2
        FrenchTaxSystem::REAL_REGIMEN_DEDUCTIBLE_EXPENSES[:fiscal_year2].map do |expense|
          simulation.key?(expense.to_sym) ? simulation[expense.to_sym] : 0
        end.sum
      end
    end

    # Calculate and cap if necessary the negative taxable income and postpone negative taxable if remaining
    #
    # @params [Hash] simulation a simulation created by Mini-Keyz app
    # @options simulation [Float] :house_rent_amount_per_year the income generated per year (euros)
    # @options simulation [Float] :credit_loan_cumulative_interests_paid_for_year_two how much is the credit interest cost for year 2 (euros/year)
    # @params [Float] :gross_taxable_property_income_amount the taxable income generated from the property investment to add to the global taxable income
    #
    # @return [Hash] a hash made of the net taxable property income (euros) and other values
    # @options hash [Float] :net_taxable_property_income_amount the net taxable property income generated from the investment (euros)
    # @options hash [Boolean] :negative_taxable_property_income? returns true or false if there is a negative taxable property income for this fiscal year
    # @options hash [Float] :negative_taxable_property_income_amount_to_postpone the potential negative taxable property income to postpone to the next fiscal year (euros)
    def calc_taxable_property_income_repartition(simulation, gross_taxable_property_income_amount)
      gross_property_income_minus_loan_interet_cost = simulation[:house_rent_amount_per_year] - simulation[:credit_loan_cumulative_interests_paid_for_year_two]

      # If gross_property_income_minus_loan_interet_cost is positive, we deduct all expenses from this fiscal year gross_taxable_property_income_amount and report what's left to next fiscal years
      if gross_property_income_minus_loan_interet_cost.positive? && gross_taxable_property_income_amount.abs <= CAPPED_NEGATIVE_NET_TAXABLE_INCOME_AMOUNT
        {
          net_taxable_property_income_amount: gross_taxable_property_income_amount,
          negative_taxable_property_income?: gross_taxable_property_income_amount.negative?,
          negative_taxable_property_income_amount_to_postpone: 0
        }
      elsif gross_property_income_minus_loan_interet_cost.positive? && gross_taxable_property_income_amount.abs > CAPPED_NEGATIVE_NET_TAXABLE_INCOME_AMOUNT
        {
          net_taxable_property_income_amount: - CAPPED_NEGATIVE_NET_TAXABLE_INCOME_AMOUNT,
          negative_taxable_property_income?: true,
          negative_taxable_property_income_amount_to_postpone: (gross_taxable_property_income_amount + CAPPED_NEGATIVE_NET_TAXABLE_INCOME_AMOUNT).abs
        }
      # If gross_property_income_minus_loan_interet_cost is negative, we deduct all expenses EXCEPT credit interest costs from this fiscal year gross_taxable_property_income_amount and report what's left + credit interest cost to next fiscal years
      elsif gross_property_income_minus_loan_interet_cost.negative? && gross_taxable_property_income_amount.abs <= CAPPED_NEGATIVE_NET_TAXABLE_INCOME_AMOUNT
        {
          net_taxable_property_income_amount: gross_taxable_property_income_amount + simulation[:credit_loan_cumulative_interests_paid_for_year_two],
          negative_taxable_property_income?: true,
          negative_taxable_property_income_amount_to_postpone: simulation[:credit_loan_cumulative_interests_paid_for_year_two]
        }
      elsif gross_property_income_minus_loan_interet_cost.negative? && gross_taxable_property_income_amount.abs > CAPPED_NEGATIVE_NET_TAXABLE_INCOME_AMOUNT && (gross_taxable_property_income_amount.abs - simulation[:credit_loan_cumulative_interests_paid_for_year_two]) > CAPPED_NEGATIVE_NET_TAXABLE_INCOME_AMOUNT
        {
          net_taxable_property_income_amount: - CAPPED_NEGATIVE_NET_TAXABLE_INCOME_AMOUNT,
          negative_taxable_property_income?: true,
          negative_taxable_property_income_amount_to_postpone: (gross_taxable_property_income_amount + CAPPED_NEGATIVE_NET_TAXABLE_INCOME_AMOUNT).abs
        }
      elsif gross_property_income_minus_loan_interet_cost.negative? && gross_taxable_property_income_amount.abs > CAPPED_NEGATIVE_NET_TAXABLE_INCOME_AMOUNT && (gross_taxable_property_income_amount.abs - simulation[:credit_loan_cumulative_interests_paid_for_year_two]) <= CAPPED_NEGATIVE_NET_TAXABLE_INCOME_AMOUNT
        {
          net_taxable_property_income_amount: gross_taxable_property_income_amount + simulation[:credit_loan_cumulative_interests_paid_for_year_two],
          negative_taxable_property_income?: true,
          negative_taxable_property_income_amount_to_postpone: simulation[:credit_loan_cumulative_interests_paid_for_year_two]
        }
      end
    end
  end
end
