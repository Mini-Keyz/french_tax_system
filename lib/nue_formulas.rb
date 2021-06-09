# frozen_string_literal: true

module FrenchTaxSystem
  module NueFormulas
    extend self

    # Constants
    PROPERTY_INCOME_STANDARD_ALLOWANCE = 0.3
    CAPPED_NEGATIVE_TAXABLE_INCOME_AMOUNT = 10_700

    # Methods
    # Calculate the net taxable income generated from the property investment
    #
    # @params [Hash] simulation a simulation created by Mini-Keyz app
    # @options simulation [Integer] :house_rent_amount_per_year how much is the rent paid by the tenant (euros/year)
    # @options simulation [Integer] :house_first_works_amount how much were the first works realized (euros)
    # @options simulation [Integer] :house_landlord_charges_amount_per_year how much are the landlord charges (euros/year)
    # @options simulation [Integer] :house_property_management_amount_per_year how much is property management cost (euros/year)
    # @options simulation [Integer] :house_insurance_gli_amount_per_year how much is gli insurance cost (euros/year)
    # @options simulation [Integer] :house_insurance_pno_amount_per_year how much is pno insurance cost (euros/year)
    # @options simulation [Integer] :house_property_tax_amount_per_year how much is the property tax (euros/year)
    # @options simulation [Integer] :credit_loan_cumulative_interests_paid_for_year_two how much is the credit interest cost for year 2 (euros/year)
    # @options simulation [Integer] :credit_loan_insurance_amount_per_year how much is the credit insurance cost (euros/year)
    # @options simulation [String] :fiscal_regimen what fiscal regimen has been chosen
    # @params [Integer] investment_fiscal_year indicates the investment fiscal year on which the calculation is made
    #
    # @return [Hash] fiscal_year* the corresponding year * as requested in @params
    # @options fiscal_year* [Integer] :net_taxable_property_income_amount the taxable income generated from the property investment to add to the global taxable income
    # @options fiscal_year* [Boolean] :negative_taxable_property_income?  are we doing a taxable income reduction thks to our property investment
    # @options fiscal_year* [Integer] :negative_taxable_property_income_amount_to_postpone negative taxable property income amount to postpone to the next fiscal year
    def calc_net_taxable_property_income_amount(simulation, postponed_negative_taxable_property_income_from_previous_fiscal_year, investment_fiscal_year)
      # Calculate net taxable property income amount thks to fiscal regimen
      net_taxable_property_income_amount = if simulation[:fiscal_regimen] == "Forfait"
                                             simulation[:house_rent_amount_per_year] * (1 - PROPERTY_INCOME_STANDARD_ALLOWANCE)

                                           elsif simulation[:fiscal_regimen] == "Réel" && investment_fiscal_year == 1
                                             deductible_expenses = FrenchTaxSystem::REAL_REGIMEN_DEDUCTIBLE_EXPENSES[:fiscal_year1].map do |expense|
                                               simulation.key?(expense.to_sym) ? simulation[expense.to_sym] : 0
                                             end.sum
                                             simulation[:house_rent_amount_per_year] - deductible_expenses

                                           elsif simulation[:fiscal_regimen] == "Réel" && investment_fiscal_year >= 2
                                             deductible_expenses = FrenchTaxSystem::REAL_REGIMEN_DEDUCTIBLE_EXPENSES[:fiscal_year2].map do |expense|
                                               simulation.key?(expense.to_sym) ? simulation[expense.to_sym] : 0
                                             end.sum
                                             simulation[:house_rent_amount_per_year] - deductible_expenses

                                           end

      # Add postponed negative taxable property income from previous fiscal year
      net_taxable_property_income_amount -= postponed_negative_taxable_property_income_from_previous_fiscal_year

      # Cap negativity of net taxable amount and postpone negative taxable if remaining

      # Return a hash
      {
        "fiscal_year#{investment_fiscal_year}".to_sym => {
          net_taxable_property_income_amount: net_taxable_property_income_amount,
          negative_taxable_property_income?: net_taxable_property_income_amount.negative?,
          negative_taxable_property_income_amount_to_postpone: 300
        }
      }
    end
  end
end
