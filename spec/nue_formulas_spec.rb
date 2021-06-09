# frozen_string_literal: true

RSpec.describe FrenchTaxSystem::NueFormulas do
  let(:simulation_lyon) do
    {
      house_rent_amount_per_year: 2_000,
      house_first_works_amount: 15_000,
      house_landlord_charges_amount_per_year: 2_000,
      house_property_management_amount_per_year: 500,
      house_insurance_gli_amount_per_year: 200,
      house_insurance_pno_amount_per_year: 100,
      house_property_tax_amount_per_year: 2_000,
      credit_loan_cumulative_interests_paid_for_year_two: 200,
      credit_loan_insurance_amount_per_year: 500,
      fiscal_regimen: "Réel"
    }
  end

  describe "#calc_net_taxable_property_income_amount(simulation, investment_fiscal_year)" do
    it "returns the net taxable property income amount incurred from the potential investment" do
      result_lyon_first_year = FrenchTaxSystem::NueFormulas.calc_net_taxable_property_income_amount(simulation_lyon, 0, 1)
      expect(result_lyon_first_year).to be_a(Hash)
      expect(result_lyon_first_year).to be_within(0.01).of(2500)
    end
  end
end
