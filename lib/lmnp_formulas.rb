# frozen_string_literal: true

module FrenchTaxSystem
  module LmnpFormulas
    extend self

    # Constants
    PROPERTY_INCOME_STANDARD_ALLOWANCE = 0.5

    # Methods
    # Calculate the net taxable income generated from the property investment
    #
    # @params [Hash] simulation a simulation created by Mini-Keyz app
    # @options simulation [Integer] :house_price_bought_amount how much was the house bought (euros)
    # @options simulation [Integer] :house_first_works_amount how much were the first works realized (euros)
    # @options simulation [Integer] :house_total_charges_amount_per_year how much are the total charges (euros/year)
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
    # params [Integer] indicates the investment fiscal year on which the calculation is made
    # @return [Float] the final income tax to pay (euros)
    def calc_net_taxable_property_income_amount(simulation, investment_fiscal_year)
      if investment_fiscal_year == 1
        investment_fiscal_year
      elsif investment_fiscal_year >= 2
        investment_fiscal_year = 2
      else
        raise ArgumentError, "Not a valid argument, it should be a positive integer superior or equal to 1"
      end

      case simulation[:fiscal_regimen]
      when "Réel"
        deductible_expenses = FrenchTaxSystem::REAL_REGIMEN_DEDUCTIBLE_EXPENSES["fiscal_year#{investment_fiscal_year}".to_sym].map do |expense|
          simulation.key?(expense.to_sym) ? simulation[expense.to_sym] : 0
        end.sum
        simulation[:house_rent_amount_per_year] - deductible_expenses
      when "Forfait"
        simulation[:house_rent_amount_per_year] * (1 - PROPERTY_INCOME_STANDARD_ALLOWANCE)
      end
    end
  end
end
