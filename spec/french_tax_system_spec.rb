# frozen_string_literal: true

RSpec.describe FrenchTaxSystem do
  it "has a version number" do
    expect(FrenchTaxSystem::VERSION).not_to be nil
  end

  let(:simulation_lyon) do
    {
      house_city: "Lyon 01",
      house_price_bought_amount: 500_000,
      house_first_works_amount: 25_000,
      house_total_charges_amount_per_year: 2750,
      house_property_tax_amount_per_year: 2500,
      house_rent_amount_per_month: 2500,
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

  let(:simulation_bordeaux) do
    {
      house_city: "Bordeaux",
      house_price_bought_amount: 100_000,
      house_first_works_amount: 0,
      house_total_charges_amount_per_year: 500,
      house_property_tax_amount_per_year: 300,
      house_rent_amount_per_month: 450,
      house_property_management_cost_percentage: 0.08,
      credit_loan_amount: 100_000,
      credit_loan_duration: 20,
      fiscal_status: "LMNP",
      fiscal_regimen: "Réel",
      fiscal_revenues_p1: 25_000,
      fiscal_revenues_p2: 35_000,
      fiscal_marital_status: "Marié / Pacsé",
      fiscal_nb_dependent_children: 3,
      fiscal_nb_alternate_custody_children: 0
    }
  end

  let(:simulation_nimes) do
    {
      house_city: "Nîmes",
      house_price_bought_amount: 300_000,
      house_first_works_amount: 5_000,
      house_total_charges_amount_per_year: 1_500,
      house_property_tax_amount_per_year: 1_000,
      house_rent_amount_per_month: 2_000,
      house_property_management_cost_percentage: 0.08,
      credit_loan_amount: 200_000,
      credit_loan_duration: 20,
      fiscal_status: "Meublé",
      fiscal_regimen: "Forfait",
      fiscal_revenues_p1: 80_000,
      fiscal_revenues_p2: 65_000,
      fiscal_marital_status: "Marié / Pacsé",
      fiscal_nb_dependent_children: 2,
      fiscal_nb_alternate_custody_children: 3
    }
  end

  let(:simulation_lille) do
    {
      house_city: "Lille",
      house_price_bought_amount: 150_000,
      house_first_works_amount: 15_500,
      house_total_charges_amount_per_year: 1_200,
      house_property_tax_amount_per_year: 500,
      house_rent_amount_per_month: 600,
      house_property_management_cost_percentage: 0,
      credit_loan_amount: 180_000,
      credit_loan_duration: 20,
      fiscal_status: "Vide",
      fiscal_regimen: "Réel",
      fiscal_revenues_p1: 55_000,
      fiscal_marital_status: "Célibataire",
      fiscal_nb_dependent_children: 0,
      fiscal_nb_alternate_custody_children: 4
    }
  end

  let(:simulation_agen) do
    {
      house_city: "Agen",
      house_price_bought_amount: 150_000,
      house_first_works_amount: 15_500,
      house_total_charges_amount_per_year: 1_200,
      house_property_tax_amount_per_year: 500,
      house_rent_amount_per_month: 600,
      house_property_management_cost_percentage: 0,
      credit_loan_amount: 180_000,
      credit_loan_duration: 20,
      fiscal_status: "Vide",
      fiscal_regimen: "Réel",
      fiscal_revenues_p1: 61_111,
      fiscal_revenues_p2: 50_000,
      fiscal_marital_status: "Marié / Pacsé",
      fiscal_nb_dependent_children: 3,
      fiscal_nb_alternate_custody_children: 0
    }
  end

  describe "#calc_global_net_taxable_amount(simulation, net_taxable_property_income)" do
    context "when it has no property income" do
      it "returns the net taxable amount" do
        result_lyon = FrenchTaxSystem.calc_global_net_taxable_amount(simulation_lyon, 0)
        result_bordeaux = FrenchTaxSystem.calc_global_net_taxable_amount(simulation_bordeaux, 0)
        expect(result_lyon).to be_within(0.01).of(90_000)
        expect(result_bordeaux).to be_within(0.01).of(54_000)
      end
    end

    context "when it has some property income" do
      it "returns the net taxable amount" do
        result_lyon = FrenchTaxSystem.calc_global_net_taxable_amount(simulation_lyon, 20_000)
        result_bordeaux = FrenchTaxSystem.calc_global_net_taxable_amount(simulation_bordeaux, 2_000)
        expect(result_lyon).to be_within(0.01).of(110_000)
        expect(result_bordeaux).to be_within(0.01).of(56_000)
      end
    end
  end

  describe "#calc_fiscal_nb_parts(simulation)" do
    let(:simulation_fiscal_parts_one) do
      {
        fiscal_marital_status: "Célibataire",
        fiscal_nb_dependent_children: 2,
        fiscal_nb_alternate_custody_children: 1
      }
    end

    let(:simulation_fiscal_parts_two) do
      {
        fiscal_marital_status: "Célibataire",
        fiscal_nb_dependent_children: 1,
        fiscal_nb_alternate_custody_children: 0
      }
    end

    let(:simulation_fiscal_parts_three) do
      {
        fiscal_marital_status: "Célibataire",
        fiscal_nb_dependent_children: 0,
        fiscal_nb_alternate_custody_children: 1
      }
    end

    let(:simulation_fiscal_parts_four) do
      {
        fiscal_marital_status: "Célibataire",
        fiscal_nb_dependent_children: 6,
        fiscal_nb_alternate_custody_children: 4
      }
    end

    let(:simulation_fiscal_parts_five) do
      {
        fiscal_marital_status: "Célibataire",
        fiscal_nb_dependent_children: 1,
        fiscal_nb_alternate_custody_children: 1
      }
    end

    it "returns household's fiscal parts number" do
      result_lyon = FrenchTaxSystem.calc_fiscal_nb_parts(simulation_lyon)
      result_bordeaux = FrenchTaxSystem.calc_fiscal_nb_parts(simulation_bordeaux)
      result_nimes = FrenchTaxSystem.calc_fiscal_nb_parts(simulation_nimes)
      result_lille = FrenchTaxSystem.calc_fiscal_nb_parts(simulation_lille)
      expect(result_lyon).to eq(3.5)
      expect(result_bordeaux).to eq(4)
      expect(result_nimes).to eq(4.5)
      expect(result_lille).to eq(2.75)

      result_simulation_one = FrenchTaxSystem.calc_fiscal_nb_parts(simulation_fiscal_parts_one)
      result_simulation_two = FrenchTaxSystem.calc_fiscal_nb_parts(simulation_fiscal_parts_two)
      result_simulation_three = FrenchTaxSystem.calc_fiscal_nb_parts(simulation_fiscal_parts_three)
      result_simulation_four = FrenchTaxSystem.calc_fiscal_nb_parts(simulation_fiscal_parts_four)
      result_simulation_five = FrenchTaxSystem.calc_fiscal_nb_parts(simulation_fiscal_parts_five)
      expect(result_simulation_one).to eq(3)
      expect(result_simulation_two).to eq(2)
      expect(result_simulation_three).to eq(1.5)
      expect(result_simulation_four).to eq(8.5)
      expect(result_simulation_five).to eq(2.25)
    end
  end

  describe "#calc_fiscal_nb_parts_incurred_from_children(simulation)" do
    it "returns household's fiscal parts number incurred from dependant and alternate custody children" do
      result_lyon = FrenchTaxSystem.calc_fiscal_nb_parts_incurred_from_children(simulation_lyon)
      result_bordeaux = FrenchTaxSystem.calc_fiscal_nb_parts_incurred_from_children(simulation_bordeaux)
      result_nimes = FrenchTaxSystem.calc_fiscal_nb_parts_incurred_from_children(simulation_nimes)
      result_lille = FrenchTaxSystem.calc_fiscal_nb_parts_incurred_from_children(simulation_lille)
      expect(result_lyon).to eq(1.5)
      expect(result_bordeaux).to eq(2)
      expect(result_nimes).to eq(2.5)
      expect(result_lille).to eq(1.5)
    end
  end

  describe "#calc_family_quotient_amount(global_net_taxable_income_amount, fiscal_nb_parts)" do
    context "when it has no property income" do
      it "returns the family quotient amount" do
        result_lyon = FrenchTaxSystem.calc_family_quotient_amount(90_000, 3.5)
        result_bordeaux = FrenchTaxSystem.calc_family_quotient_amount(54_000, 4)
        expect(result_lyon).to be_within(0.01).of(25_714.28)
        expect(result_bordeaux).to be_within(0.01).of(13_500)
      end
    end

    context "when it has some property income" do
      it "returns the family quotient amount" do
        result_lyon = FrenchTaxSystem.calc_family_quotient_amount(110_000, 3.5)
        result_bordeaux = FrenchTaxSystem.calc_family_quotient_amount(56_000, 4)
        expect(result_lyon).to be_within(0.01).of(31_428.57)
        expect(result_bordeaux).to be_within(0.01).of(14_000)
      end
    end
  end

  describe "#calc_aggregated_tax_amount(family_quotient_amount, current_year)" do
    it "returns the aggregated tax amount" do
      current_year = Date.today.year
      result_lyon = FrenchTaxSystem.calc_aggregated_tax_amount(30_000, current_year)
      result_bordeaux = FrenchTaxSystem.calc_aggregated_tax_amount(13_500, current_year)
      result_lyon_with_property_income = FrenchTaxSystem.calc_aggregated_tax_amount(36_666.67, current_year)
      result_bordeaux_with_property_income = FrenchTaxSystem.calc_aggregated_tax_amount(14_000, current_year)
      expect(result_lyon).to be_within(0.01).of(3005.45)
      expect(result_bordeaux).to be_within(0.01).of(375.65)
      expect(result_lyon_with_property_income).to be_within(0.01).of(5005.45)
      expect(result_bordeaux_with_property_income).to be_within(0.01).of(430.65)
    end
  end

  describe "#calc_income_taxes_scale(simulation, calculation_method)" do
    context "when it has no property income" do
      it "returns the family quotient amount" do
        result_lyon = FrenchTaxSystem.calc_income_taxes_scale(simulation_lyon, "without_property_income")
        result_bordeaux = FrenchTaxSystem.calc_income_taxes_scale(simulation_bordeaux, "without_property_income")
        expect(result_lyon).to eq({ family_quotient_amount: { start_scale: 25_711, end_scale: 73_516 }, tax: 0.3 })
        expect(result_bordeaux).to eq({ family_quotient_amount: { start_scale: 10_085, end_scale: 25_710 }, tax: 0.11 })
      end
    end

    context "when it has some property income" do
      it "returns the family quotient amount" do
        result_lyon = FrenchTaxSystem.calc_income_taxes_scale(simulation_lyon, "with_property_income")
        result_bordeaux = FrenchTaxSystem.calc_income_taxes_scale(simulation_bordeaux, "with_property_income")
        expect(result_lyon).to eq({ family_quotient_amount: { start_scale: 25_711, end_scale: 73_516 }, tax: 0.3 })
        expect(result_bordeaux).to eq({ family_quotient_amount: { start_scale: 10_085, end_scale: 25_710 }, tax: 0.11 })
      end
    end
  end
end
