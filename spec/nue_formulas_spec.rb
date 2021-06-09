# frozen_string_literal: true

RSpec.describe FrenchTaxSystem::NueFormulas do
  let(:simulation_lyon) do
    {
      house_city: "Lyon 01",
      house_price_bought_amount: 500_000,
      house_first_works_amount: 25_000,
      house_total_charges_amount_per_year: 2750,
      house_property_tax_amount_per_year: 2500,
      house_rent_amount_per_month: 2500,
      house_rent_amount_per_year: 30_000,
      house_property_management_cost_percentage: 0,
      credit_loan_amount: 550_000,
      credit_loan_duration: 20,
      fiscal_status: "Vide",
      fiscal_regimen: "Réel",
      fiscal_revenues_p1: 75_000,
      fiscal_revenues_p2: 25_000,
      fiscal_marital_status: "Marié / Pacsé",
      fiscal_nb_dependent_children: 2,
      fiscal_nb_alternate_custody_children: 1
    }
  end

  describe "#calc_net_taxable_property_income_amount(simulation, investment_fiscal_year)" do
    it "returns the net taxable property income amount incurred from the potential investment" do
      result_lyon_first_year = FrenchTaxSystem::NueFormulas.calc_net_taxable_property_income_amount(simulation_lyon, 1)
      expect(result_lyon_first_year).to be_within(0.01).of(2500)
    end
  end
end
