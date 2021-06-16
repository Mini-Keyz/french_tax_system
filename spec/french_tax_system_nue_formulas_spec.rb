# frozen_string_literal: true

RSpec.describe FrenchTaxSystem do
  it "has a version number" do
    expect(FrenchTaxSystem::VERSION).not_to be nil
  end

  let(:simulation_lyon) do
    {
      fiscal_status: "Vide",

      house_rent_amount_per_year: 23_200,
      house_first_works_amount: 40_000,
      house_landlord_charges_amount_per_year: 3_600,
      house_property_management_amount_per_year: 1_856,
      house_insurance_gli_amount_per_year: 812,
      house_insurance_pno_amount_per_year: 100,
      house_property_tax_amount_per_year: 2_000,
      credit_loan_cumulative_interests_paid_for_year_two: 5_499.91,
      credit_loan_insurance_amount_per_year: 1740,
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
      fiscal_status: "Vide",

      house_rent_amount_per_year: 8_076,
      house_first_works_amount: 5_000,
      house_landlord_charges_amount_per_year: 0,
      house_property_management_amount_per_year: 600,
      house_insurance_gli_amount_per_year: 282.66,
      house_insurance_pno_amount_per_year: 100,
      house_property_tax_amount_per_year: 1_200,
      credit_loan_cumulative_interests_paid_for_year_two: 1_227.42,
      credit_loan_insurance_amount_per_year: 405,
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
      fiscal_status: "Vide",

      house_rent_amount_per_year: 74_800,
      house_first_works_amount: 125_000,
      house_landlord_charges_amount_per_year: 6_000,
      house_property_management_amount_per_year: 5_984,
      house_insurance_gli_amount_per_year: 2_618,
      house_insurance_pno_amount_per_year: 100,
      house_property_tax_amount_per_year: 5_500,
      credit_loan_cumulative_interests_paid_for_year_two: 8_869.46,
      credit_loan_insurance_amount_per_year: 2_850,
      fiscal_regimen: "Réel",

      fiscal_revenues_p1: 80_000,
      fiscal_revenues_p2: 65_000,
      fiscal_marital_status: "Marié / Pacsé",
      fiscal_nb_dependent_children: 2,
      fiscal_nb_alternate_custody_children: 3
    }
  end

  let(:simulation_lille) do
    {
      fiscal_status: "Vide",

      house_rent_amount_per_year: 7_270,
      house_first_works_amount: 2_500,
      house_landlord_charges_amount_per_year: 540,
      house_property_management_amount_per_year: 0,
      house_insurance_gli_amount_per_year: 254.45,
      house_insurance_pno_amount_per_year: 100,
      house_property_tax_amount_per_year: 300,
      credit_loan_cumulative_interests_paid_for_year_two: 645.21,
      credit_loan_insurance_amount_per_year: 225,
      fiscal_regimen: "Réel",

      fiscal_revenues_p1: 55_000,
      fiscal_marital_status: "Célibataire",
      fiscal_nb_dependent_children: 0,
      fiscal_nb_alternate_custody_children: 4
    }
  end

  let(:simulation_agen) do
    {
      fiscal_status: "Vide",

      house_rent_amount_per_year: 28_944,
      house_first_works_amount: 0,
      house_landlord_charges_amount_per_year: 2_000,
      house_property_management_amount_per_year: 0,
      house_insurance_gli_amount_per_year: 1_013.04,
      house_insurance_pno_amount_per_year: 100,
      house_property_tax_amount_per_year: 3_500,
      credit_loan_cumulative_interests_paid_for_year_two: 2_800.88,
      credit_loan_insurance_amount_per_year: 900,
      fiscal_regimen: "Réel",

      fiscal_revenues_p1: 61_111.11,
      fiscal_revenues_p2: 50_000,
      fiscal_marital_status: "Marié / Pacsé",
      fiscal_nb_dependent_children: 3,
      fiscal_nb_alternate_custody_children: 0
    }
  end

  let(:simulation_grenoble) do
    {
      fiscal_status: "Vide",

      house_rent_amount_per_year: 13_760,
      house_first_works_amount: 10_000,
      house_landlord_charges_amount_per_year: 1_440,
      house_property_management_amount_per_year: 1_100.80,
      house_insurance_gli_amount_per_year: 481.60,
      house_insurance_pno_amount_per_year: 100,
      house_property_tax_amount_per_year: 250,
      credit_loan_cumulative_interests_paid_for_year_two: 0,
      credit_loan_insurance_amount_per_year: 0,
      fiscal_regimen: "Réel",

      fiscal_revenues_p1: 35_000,
      fiscal_marital_status: "Célibataire",
      fiscal_nb_dependent_children: 0,
      fiscal_nb_alternate_custody_children: 0
    }
  end

  let(:simulation_toulouse) do
    {
      fiscal_status: "Vide",

      house_rent_amount_per_year: 5_508,
      house_first_works_amount: 0,
      house_landlord_charges_amount_per_year: 410,
      house_property_management_amount_per_year: 0,
      house_insurance_gli_amount_per_year: 192.78,
      house_insurance_pno_amount_per_year: 100,
      house_property_tax_amount_per_year: 200,
      credit_loan_cumulative_interests_paid_for_year_two: 858.94,
      credit_loan_insurance_amount_per_year: 276,
      fiscal_regimen: "Réel",

      fiscal_revenues_p1: 25_000,
      fiscal_marital_status: "Célibataire",
      fiscal_nb_dependent_children: 2,
      fiscal_nb_alternate_custody_children: 0
    }
  end

  let(:simulation_limoges) do
    {
      fiscal_status: "Vide",

      house_rent_amount_per_year: 32_160,
      house_first_works_amount: 25_000,
      house_landlord_charges_amount_per_year: 3_000,
      house_property_management_amount_per_year: 2_572.8,
      house_insurance_gli_amount_per_year: 1_125.6,
      house_insurance_pno_amount_per_year: 100,
      house_property_tax_amount_per_year: 4_000,
      credit_loan_cumulative_interests_paid_for_year_two: 2_520.80,
      credit_loan_insurance_amount_per_year: 810,
      fiscal_regimen: "Réel",

      fiscal_revenues_p1: 80_000,
      fiscal_revenues_p2: 120_000,
      fiscal_marital_status: "Marié / Pacsé",
      fiscal_nb_dependent_children: 3,
      fiscal_nb_alternate_custody_children: 1
    }
  end

  let(:simulation_rennes) do
    {
      fiscal_status: "Vide",

      house_rent_amount_per_year: 26_060,
      house_first_works_amount: 50_000,
      house_landlord_charges_amount_per_year: 2_500,
      house_property_management_amount_per_year: 0,
      house_insurance_gli_amount_per_year: 912.1,
      house_insurance_pno_amount_per_year: 100,
      house_property_tax_amount_per_year: 1_950,
      credit_loan_cumulative_interests_paid_for_year_two: 2_334.07,
      credit_loan_insurance_amount_per_year: 750,
      fiscal_regimen: "Réel",

      fiscal_revenues_p1: 50_000,
      fiscal_marital_status: "Célibataire",
      fiscal_nb_dependent_children: 2,
      fiscal_nb_alternate_custody_children: 3
    }
  end

  let(:simulation_tours) do
    {
      fiscal_status: "Vide",

      house_rent_amount_per_year: 24_544,
      house_first_works_amount: 25_000,
      house_landlord_charges_amount_per_year: 1_200,
      house_property_management_amount_per_year: 1_963.52,
      house_insurance_gli_amount_per_year: 859.04,
      house_insurance_pno_amount_per_year: 100,
      house_property_tax_amount_per_year: 1_250,
      credit_loan_cumulative_interests_paid_for_year_two: 2_800.88,
      credit_loan_insurance_amount_per_year: 900,
      fiscal_regimen: "Réel",

      fiscal_revenues_p1: 45_000,
      fiscal_revenues_p2: 37_500,
      fiscal_marital_status: "Marié / Pacsé",
      fiscal_nb_dependent_children: 0,
      fiscal_nb_alternate_custody_children: 0
    }
  end

  let(:simulation_toulon) do
    {
      fiscal_status: "Vide",

      house_rent_amount_per_year: 29_736,
      house_first_works_amount: 15_000,
      house_landlord_charges_amount_per_year: 3_250,
      house_property_management_amount_per_year: 0,
      house_insurance_gli_amount_per_year: 1040.76,
      house_insurance_pno_amount_per_year: 100,
      house_property_tax_amount_per_year: 3_000,
      credit_loan_cumulative_interests_paid_for_year_two: 4_741.31,
      credit_loan_insurance_amount_per_year: 1_500,
      fiscal_regimen: "Forfait",

      fiscal_revenues_p1: 200_000,
      fiscal_revenues_p2: 125_000,
      fiscal_marital_status: "Marié / Pacsé",
      fiscal_nb_dependent_children: 3,
      fiscal_nb_alternate_custody_children: 0
    }
  end

  let(:simulation_la_ciotat) do
    {
      fiscal_status: "Vide",

      house_rent_amount_per_year: 12_512,
      house_first_works_amount: 5_000,
      house_landlord_charges_amount_per_year: 1_500,
      house_property_management_amount_per_year: 0,
      house_insurance_gli_amount_per_year: 437.92,
      house_insurance_pno_amount_per_year: 100,
      house_property_tax_amount_per_year: 1_250,
      credit_loan_cumulative_interests_paid_for_year_two: 2_909.43,
      credit_loan_insurance_amount_per_year: 960,
      fiscal_regimen: "Forfait",

      fiscal_revenues_p1: 120_000,
      fiscal_revenues_p2: 65_000,
      fiscal_marital_status: "Marié / Pacsé",
      fiscal_nb_dependent_children: 0,
      fiscal_nb_alternate_custody_children: 2
    }
  end

  describe "With property income" do
    context "when year 1" do
      describe "#calc_taxes_amount_per_year(simulation, calculation_method, investment_top_fiscal_year)" do
        it "returns a nice array" do
          result_lyon = FrenchTaxSystem.calc_taxes_amount_per_year(simulation_lyon, "with_property_income", 10)
          result_bordeaux = FrenchTaxSystem.calc_taxes_amount_per_year(simulation_bordeaux, "with_property_income", 10)
          result_nimes = FrenchTaxSystem.calc_taxes_amount_per_year(simulation_nimes, "with_property_income", 10)
          result_lille = FrenchTaxSystem.calc_taxes_amount_per_year(simulation_lille, "with_property_income", 10)
          result_agen = FrenchTaxSystem.calc_taxes_amount_per_year(simulation_agen, "with_property_income", 10)
          result_grenoble = FrenchTaxSystem.calc_taxes_amount_per_year(simulation_grenoble, "with_property_income", 10)
          result_toulouse = FrenchTaxSystem.calc_taxes_amount_per_year(simulation_toulouse, "with_property_income", 10)
          result_limoges = FrenchTaxSystem.calc_taxes_amount_per_year(simulation_limoges, "with_property_income", 10)
          result_rennes = FrenchTaxSystem.calc_taxes_amount_per_year(simulation_rennes, "with_property_income", 10)
          result_tours = FrenchTaxSystem.calc_taxes_amount_per_year(simulation_tours, "with_property_income", 10)
          result_toulon = FrenchTaxSystem.calc_taxes_amount_per_year(simulation_toulon, "with_property_income", 10)
          result_la_ciotat = FrenchTaxSystem.calc_taxes_amount_per_year(simulation_la_ciotat, "with_property_income", 10)
          # Results should not change between fiscal years because it is only based on fiscal_revenues_p1 & 2
          expect(result_lyon).to be_a(Array)
          expect(result_bordeaux).to be_a(Array)
          expect(result_nimes).to be_a(Array)
          expect(result_lille).to be_a(Array)
          expect(result_agen).to be_a(Array)
          expect(result_grenoble).to be_a(Array)
          expect(result_toulouse).to be_a(Array)
          expect(result_limoges).to be_a(Array)
          expect(result_rennes).to be_a(Array)
          expect(result_tours).to be_a(Array)
          expect(result_toulon).to be_a(Array)
          expect(result_la_ciotat).to be_a(Array)
        end

        it "returns income tax params" do
          result_lyon = FrenchTaxSystem.calc_taxes_amount_per_year(simulation_lyon, "with_property_income", 10)
          result_bordeaux = FrenchTaxSystem.calc_taxes_amount_per_year(simulation_bordeaux, "with_property_income", 10)
          result_nimes = FrenchTaxSystem.calc_taxes_amount_per_year(simulation_nimes, "with_property_income", 10)
          result_lille = FrenchTaxSystem.calc_taxes_amount_per_year(simulation_lille, "with_property_income", 10)
          result_agen = FrenchTaxSystem.calc_taxes_amount_per_year(simulation_agen, "with_property_income", 10)
          result_grenoble = FrenchTaxSystem.calc_taxes_amount_per_year(simulation_grenoble, "with_property_income", 10)
          result_toulouse = FrenchTaxSystem.calc_taxes_amount_per_year(simulation_toulouse, "with_property_income", 10)
          result_limoges = FrenchTaxSystem.calc_taxes_amount_per_year(simulation_limoges, "with_property_income", 10)
          result_rennes = FrenchTaxSystem.calc_taxes_amount_per_year(simulation_rennes, "with_property_income", 10)
          result_tours = FrenchTaxSystem.calc_taxes_amount_per_year(simulation_tours, "with_property_income", 10)
          result_toulon = FrenchTaxSystem.calc_taxes_amount_per_year(simulation_toulon, "with_property_income", 10)
          result_la_ciotat = FrenchTaxSystem.calc_taxes_amount_per_year(simulation_la_ciotat, "with_property_income", 10)
          expect(result_lyon[0][:income_tax][:income_tax_amount]).to be_within(0.01).of(7_090.90)
          expect(result_bordeaux[0][:income_tax][:income_tax_amount]).to be_within(0.01).of(775.43825)
          expect(result_nimes[0][:income_tax][:income_tax_amount]).to be_within(0.01).of(16_100.90)
          expect(result_lille[0][:income_tax][:income_tax_amount]).to be_within(0.01).of(2_823.05)
          expect(result_agen[0][:income_tax][:income_tax_amount]).to be_within(0.01).of(17_319.92)
          expect(result_grenoble[0][:income_tax][:income_tax_amount]).to be_within(0.01).of(3_571.73)
          expect(result_toulouse[0][:income_tax][:income_tax_amount]).to be_within(0.01).of(0)
          expect(result_limoges[0][:income_tax][:income_tax_amount]).to be_within(0.01).of(34_929.19)
          expect(result_rennes[0][:income_tax][:income_tax_amount]).to be_within(0.01).of(0)
          expect(result_tours[0][:income_tax][:income_tax_amount]).to be_within(0.01).of(7_427.07)
          expect(result_toulon[0][:income_tax][:income_tax_amount]).to be_within(0.01).of(94_015.79)
          expect(result_la_ciotat[0][:income_tax][:income_tax_amount]).to be_within(0.01).of(42_122.50)
        end

        it "returns social contribution amount equal to 0" do
          result_lyon = FrenchTaxSystem.calc_taxes_amount_per_year(simulation_lyon, "with_property_income", 10)
          result_bordeaux = FrenchTaxSystem.calc_taxes_amount_per_year(simulation_bordeaux, "with_property_income", 10)
          result_nimes = FrenchTaxSystem.calc_taxes_amount_per_year(simulation_nimes, "with_property_income", 10)
          result_lille = FrenchTaxSystem.calc_taxes_amount_per_year(simulation_lille, "with_property_income", 10)
          result_agen = FrenchTaxSystem.calc_taxes_amount_per_year(simulation_agen, "with_property_income", 10)
          result_grenoble = FrenchTaxSystem.calc_taxes_amount_per_year(simulation_grenoble, "with_property_income", 10)
          result_toulouse = FrenchTaxSystem.calc_taxes_amount_per_year(simulation_toulouse, "with_property_income", 10)
          result_limoges = FrenchTaxSystem.calc_taxes_amount_per_year(simulation_limoges, "with_property_income", 10)
          result_rennes = FrenchTaxSystem.calc_taxes_amount_per_year(simulation_rennes, "with_property_income", 10)
          result_tours = FrenchTaxSystem.calc_taxes_amount_per_year(simulation_tours, "with_property_income", 10)
          result_toulon = FrenchTaxSystem.calc_taxes_amount_per_year(simulation_toulon, "with_property_income", 10)
          result_la_ciotat = FrenchTaxSystem.calc_taxes_amount_per_year(simulation_la_ciotat, "with_property_income", 10)
          expect(result_lyon[0][:social_contributions_amount]).to be_within(0.01).of(0)
          expect(result_bordeaux[0][:social_contributions_amount]).to be_within(0.01).of(0)
          expect(result_nimes[0][:social_contributions_amount]).to be_within(0.01).of(0)
          expect(result_lille[0][:social_contributions_amount]).to be_within(0.01).of(465.3185)
          expect(result_agen[0][:social_contributions_amount]).to be_within(0.01).of(3_204.3738)
          expect(result_grenoble[0][:social_contributions_amount]).to be_within(0.01).of(66.6672)
          expect(result_toulouse[0][:social_contributions_amount]).to be_within(0.01).of(596.8882)
          expect(result_limoges[0][:social_contributions_amount]).to be_within(0.01).of(0)
          expect(result_rennes[0][:social_contributions_amount]).to be_within(0.01).of(0)
          expect(result_tours[0][:social_contributions_amount]).to be_within(0.01).of(0)
          expect(result_toulon[0][:social_contributions_amount]).to be_within(0.01).of(3_580.2144)
          expect(result_la_ciotat[0][:social_contributions_amount]).to be_within(0.01).of(1_506.4448)
        end
      end

      describe "#calc_income_tax_amount_for_year(simulation, calculation_method, postponed_negative_taxable_property_income_from_previous_fiscal_year, investment_fiscal_year)" do
        it "returns a nice hash" do
          result_lyon = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_lyon, "with_property_income", 0, 1)
          result_bordeaux = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_bordeaux, "with_property_income", 0, 2)
          result_nimes = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_nimes, "with_property_income", 0, 3)
          result_lille = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_lille, "with_property_income", 0, 4)
          result_agen = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_agen, "with_property_income", 0, 5)
          result_grenoble = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_grenoble, "with_property_income", 0, 6)
          result_toulouse = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_toulouse, "with_property_income", 0, 7)
          result_limoges = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_limoges, "with_property_income", 0, 8)
          result_rennes = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_rennes, "with_property_income", 0, 9)
          result_tours = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_tours, "with_property_income", 0, 10)
          result_toulon = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_toulon, "with_property_income", 0, 11)
          result_la_ciotat = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_la_ciotat, "with_property_income", 0, 12)
          expect(result_lyon).to be_a(Hash)
          expect(result_bordeaux).to be_a(Hash)
          expect(result_nimes).to be_a(Hash)
          expect(result_lille).to be_a(Hash)
          expect(result_agen).to be_a(Hash)
          expect(result_grenoble).to be_a(Hash)
          expect(result_toulouse).to be_a(Hash)
          expect(result_limoges).to be_a(Hash)
          expect(result_rennes).to be_a(Hash)
          expect(result_tours).to be_a(Hash)
          expect(result_toulon).to be_a(Hash)
          expect(result_la_ciotat).to be_a(Hash)
        end

        it "returns household's fiscal parts number" do
          result_lyon = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_lyon, "with_property_income", 0, 1)
          result_bordeaux = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_bordeaux, "with_property_income", 0, 2)
          result_nimes = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_nimes, "with_property_income", 0, 3)
          result_lille = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_lille, "with_property_income", 0, 4)
          result_agen = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_agen, "with_property_income", 0, 5)
          result_grenoble = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_grenoble, "with_property_income", 0, 6)
          result_toulouse = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_toulouse, "with_property_income", 0, 7)
          result_limoges = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_limoges, "with_property_income", 0, 8)
          result_rennes = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_rennes, "with_property_income", 0, 9)
          result_tours = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_tours, "with_property_income", 0, 10)
          result_toulon = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_toulon, "with_property_income", 0, 11)
          result_la_ciotat = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_la_ciotat, "with_property_income", 0, 12)
          expect(result_lyon[:fiscal_nb_parts]).to eq(3.5)
          expect(result_bordeaux[:fiscal_nb_parts]).to eq(4)
          expect(result_nimes[:fiscal_nb_parts]).to eq(4.5)
          expect(result_lille[:fiscal_nb_parts]).to eq(3)
          expect(result_agen[:fiscal_nb_parts]).to eq(4)
          expect(result_grenoble[:fiscal_nb_parts]).to eq(1)
          expect(result_toulouse[:fiscal_nb_parts]).to eq(2.5)
          expect(result_limoges[:fiscal_nb_parts]).to eq(4.5)
          expect(result_rennes[:fiscal_nb_parts]).to eq(4)
          expect(result_tours[:fiscal_nb_parts]).to eq(2)
          expect(result_toulon[:fiscal_nb_parts]).to eq(4)
          expect(result_la_ciotat[:fiscal_nb_parts]).to eq(2.5)
        end

        it "returns the income tax" do
          result_lyon = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_lyon, "with_property_income", 0, 1)
          result_bordeaux = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_bordeaux, "with_property_income", 0, 1)
          result_nimes = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_nimes, "with_property_income", 0, 1)
          result_lille = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_lille, "with_property_income", 0, 1)
          result_agen = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_agen, "with_property_income", 0, 1)
          result_grenoble = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_grenoble, "with_property_income", 0, 1)
          result_toulouse = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_toulouse, "with_property_income", 0, 1)
          result_limoges = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_limoges, "with_property_income", 0, 1)
          result_rennes = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_rennes, "with_property_income", 0, 1)
          result_tours = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_tours, "with_property_income", 0, 1)
          result_toulon = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_toulon, "with_property_income", 0, 1)
          result_la_ciotat = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_la_ciotat, "with_property_income", 0, 1)
          expect(result_lyon[:income_tax_amount]).to be_within(0.01).of(7_090.90)
          expect(result_bordeaux[:income_tax_amount]).to be_within(0.01).of(775.43825)
          expect(result_nimes[:income_tax_amount]).to be_within(0.01).of(16_100.90)
          expect(result_lille[:income_tax_amount]).to be_within(0.01).of(2_823.05)
          expect(result_agen[:income_tax_amount]).to be_within(0.01).of(17_319.92)
          expect(result_grenoble[:income_tax_amount]).to be_within(0.01).of(3_571.73)
          expect(result_toulouse[:income_tax_amount]).to be_within(0.01).of(0)
          expect(result_limoges[:income_tax_amount]).to be_within(0.01).of(34_929.19)
          expect(result_rennes[:income_tax_amount]).to be_within(0.01).of(0)
          expect(result_tours[:income_tax_amount]).to be_within(0.01).of(7_427.07)
          expect(result_toulon[:income_tax_amount]).to be_within(0.01).of(94_015.79)
          expect(result_la_ciotat[:income_tax_amount]).to be_within(0.01).of(42_122.50)
        end

        it "returns the average tax rate" do
          result_lyon = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_lyon, "with_property_income", 0, 1)
          result_bordeaux = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_bordeaux, "with_property_income", 0, 1)
          result_nimes = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_nimes, "with_property_income", 0, 1)
          result_lille = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_lille, "with_property_income", 0, 1)
          result_agen = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_agen, "with_property_income", 0, 1)
          result_grenoble = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_grenoble, "with_property_income", 0, 1)
          result_toulouse = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_toulouse, "with_property_income", 0, 1)
          result_limoges = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_limoges, "with_property_income", 0, 1)
          result_rennes = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_rennes, "with_property_income", 0, 1)
          result_tours = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_tours, "with_property_income", 0, 1)
          result_toulon = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_toulon, "with_property_income", 0, 1)
          result_la_ciotat = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_la_ciotat, "with_property_income", 0, 1)
          expect(result_lyon[:average_tax_rate]).to be_within(0.001).of(0.0894)
          expect(result_bordeaux[:average_tax_rate]).to be_within(0.001).of(0.0146)
          expect(result_nimes[:average_tax_rate]).to be_within(0.001).of(0.1344)
          expect(result_lille[:average_tax_rate]).to be_within(0.001).of(0.0541)
          expect(result_agen[:average_tax_rate]).to be_within(0.001).of(0.1460)
          expect(result_grenoble[:average_tax_rate]).to be_within(0.001).of(0.1120)
          expect(result_toulouse[:average_tax_rate]).to be_within(0.001).of(0.0000)
          expect(result_limoges[:average_tax_rate]).to be_within(0.001).of(0.2019)
          expect(result_rennes[:average_tax_rate]).to be_within(0.001).of(0.0000)
          expect(result_tours[:average_tax_rate]).to be_within(0.001).of(0.1148)
          expect(result_toulon[:average_tax_rate]).to be_within(0.001).of(0.3001)
          expect(result_la_ciotat[:average_tax_rate]).to be_within(0.001).of(0.2403)
        end

        it "returns the global net taxable amount" do
          result_lyon = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_lyon, "with_property_income", 0, 1)
          result_bordeaux = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_bordeaux, "with_property_income", 0, 1)
          result_nimes = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_nimes, "with_property_income", 0, 1)
          result_lille = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_lille, "with_property_income", 0, 1)
          result_agen = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_agen, "with_property_income", 0, 1)
          result_grenoble = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_grenoble, "with_property_income", 0, 1)
          result_toulouse = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_toulouse, "with_property_income", 0, 1)
          result_limoges = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_limoges, "with_property_income", 0, 1)
          result_rennes = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_rennes, "with_property_income", 0, 1)
          result_tours = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_tours, "with_property_income", 0, 1)
          result_toulon = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_toulon, "with_property_income", 0, 1)
          result_la_ciotat = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_la_ciotat, "with_property_income", 0, 1)
          expect(result_lyon[:global_net_taxable_income_amount]).to be_within(0.01).of(79_300.00)
          expect(result_bordeaux[:global_net_taxable_income_amount]).to be_within(0.01).of(53_260.92)
          expect(result_nimes[:global_net_taxable_income_amount]).to be_within(0.01).of(119_800.00)
          expect(result_lille[:global_net_taxable_income_amount]).to be_within(0.01).of(52_205.34)
          expect(result_agen[:global_net_taxable_income_amount]).to be_within(0.01).of(118_630.08)
          expect(result_grenoble[:global_net_taxable_income_amount]).to be_within(0.01).of(31_887.60)
          expect(result_toulouse[:global_net_taxable_income_amount]).to be_within(0.01).of(25_970.28)
          expect(result_limoges[:global_net_taxable_income_amount]).to be_within(0.01).of(173_030.80)
          expect(result_rennes[:global_net_taxable_income_amount]).to be_within(0.01).of(34_300.00)
          expect(result_tours[:global_net_taxable_income_amount]).to be_within(0.01).of(64_720.56)
          expect(result_toulon[:global_net_taxable_income_amount]).to be_within(0.01).of(313_315.20)
          expect(result_la_ciotat[:global_net_taxable_income_amount]).to be_within(0.01).of(175_258.40)
        end

        it "returns the net property taxable amount" do
          result_lyon = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_lyon, "with_property_income", 0, 1)
          result_bordeaux = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_bordeaux, "with_property_income", 0, 1)
          result_nimes = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_nimes, "with_property_income", 0, 1)
          result_lille = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_lille, "with_property_income", 0, 1)
          result_agen = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_agen, "with_property_income", 0, 1)
          result_grenoble = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_grenoble, "with_property_income", 0, 1)
          result_toulouse = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_toulouse, "with_property_income", 0, 1)
          result_limoges = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_limoges, "with_property_income", 0, 1)
          result_rennes = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_rennes, "with_property_income", 0, 1)
          result_tours = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_tours, "with_property_income", 0, 1)
          result_toulon = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_toulon, "with_property_income", 0, 1)
          result_la_ciotat = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_la_ciotat, "with_property_income", 0, 1)
          expect(result_lyon[:net_taxable_property_income_amount]).to be_within(0.01).of(-10_700.00)
          expect(result_bordeaux[:net_taxable_property_income_amount]).to be_within(0.01).of(-739.08)
          expect(result_nimes[:net_taxable_property_income_amount]).to be_within(0.01).of(-10_700.00)
          expect(result_lille[:net_taxable_property_income_amount]).to be_within(0.01).of(2_705.34)
          expect(result_agen[:net_taxable_property_income_amount]).to be_within(0.01).of(18_630.08)
          expect(result_grenoble[:net_taxable_property_income_amount]).to be_within(0.01).of(387.60)
          expect(result_toulouse[:net_taxable_property_income_amount]).to be_within(0.01).of(3_470.28)
          expect(result_limoges[:net_taxable_property_income_amount]).to be_within(0.01).of(-6_969.20)
          expect(result_rennes[:net_taxable_property_income_amount]).to be_within(0.01).of(-10_700.00)
          expect(result_tours[:net_taxable_property_income_amount]).to be_within(0.01).of(-9_529.44)
          expect(result_toulon[:net_taxable_property_income_amount]).to be_within(0.01).of(20_815.20)
          expect(result_la_ciotat[:net_taxable_property_income_amount]).to be_within(0.01).of(8_758.40)
        end

        it "returns true if there is a negative taxable property income" do
          result_lyon = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_lyon, "with_property_income", 0, 1)
          result_bordeaux = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_bordeaux, "with_property_income", 0, 1)
          result_nimes = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_nimes, "with_property_income", 0, 1)
          result_lille = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_lille, "with_property_income", 0, 1)
          result_agen = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_agen, "with_property_income", 0, 1)
          result_grenoble = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_grenoble, "with_property_income", 0, 1)
          result_toulouse = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_toulouse, "with_property_income", 0, 1)
          result_limoges = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_limoges, "with_property_income", 0, 1)
          result_rennes = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_rennes, "with_property_income", 0, 1)
          result_tours = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_tours, "with_property_income", 0, 1)
          result_toulon = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_toulon, "with_property_income", 0, 1)
          result_la_ciotat = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_la_ciotat, "with_property_income", 0, 1)
          expect(result_lyon[:negative_taxable_property_income?]).to eq(true)
          expect(result_bordeaux[:negative_taxable_property_income?]).to eq(true)
          expect(result_nimes[:negative_taxable_property_income?]).to eq(true)
          expect(result_lille[:negative_taxable_property_income?]).to eq(false)
          expect(result_agen[:negative_taxable_property_income?]).to eq(false)
          expect(result_grenoble[:negative_taxable_property_income?]).to eq(false)
          expect(result_toulouse[:negative_taxable_property_income?]).to eq(false)
          expect(result_limoges[:negative_taxable_property_income?]).to eq(true)
          expect(result_rennes[:negative_taxable_property_income?]).to eq(true)
          expect(result_tours[:negative_taxable_property_income?]).to eq(true)
          expect(result_toulon[:negative_taxable_property_income?]).to eq(false)
          expect(result_la_ciotat[:negative_taxable_property_income?]).to eq(false)
        end

        it "returns the negative taxable property income amount postponed to the next fiscal year" do
          result_lyon = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_lyon, "with_property_income", 0, 1)
          result_bordeaux = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_bordeaux, "with_property_income", 0, 1)
          result_nimes = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_nimes, "with_property_income", 0, 1)
          result_lille = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_lille, "with_property_income", 0, 1)
          result_agen = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_agen, "with_property_income", 0, 1)
          result_grenoble = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_grenoble, "with_property_income", 0, 1)
          result_toulouse = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_toulouse, "with_property_income", 0, 1)
          result_limoges = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_limoges, "with_property_income", 0, 1)
          result_rennes = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_rennes, "with_property_income", 0, 1)
          result_tours = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_tours, "with_property_income", 0, 1)
          result_toulon = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_toulon, "with_property_income", 0, 1)
          result_la_ciotat = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_la_ciotat, "with_property_income", 0, 1)
          expect(result_lyon[:negative_taxable_property_income_amount_to_postpone]).to be_within(0.01).of(21_707.91)
          expect(result_bordeaux[:negative_taxable_property_income_amount_to_postpone]).to be_within(0.01).of(0)
          expect(result_nimes[:negative_taxable_property_income_amount_to_postpone]).to be_within(0.01).of(71_421.46)
          expect(result_lille[:negative_taxable_property_income_amount_to_postpone]).to be_within(0.01).of(0)
          expect(result_agen[:negative_taxable_property_income_amount_to_postpone]).to be_within(0.01).of(0)
          expect(result_grenoble[:negative_taxable_property_income_amount_to_postpone]).to be_within(0.01).of(0)
          expect(result_toulouse[:negative_taxable_property_income_amount_to_postpone]).to be_within(0.01).of(0)
          expect(result_limoges[:negative_taxable_property_income_amount_to_postpone]).to be_within(0.01).of(0)
          expect(result_rennes[:negative_taxable_property_income_amount_to_postpone]).to be_within(0.01).of(21_786.17)
          expect(result_tours[:negative_taxable_property_income_amount_to_postpone]).to be_within(0.01).of(0)
          expect(result_toulon[:negative_taxable_property_income_amount_to_postpone]).to be_within(0.01).of(0)
          expect(result_la_ciotat[:negative_taxable_property_income_amount_to_postpone]).to be_within(0.01).of(0)
        end

        it "returns the discount amount on income tax for low income household" do
          result_lyon = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_lyon, "with_property_income", 0, 1)
          result_bordeaux = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_bordeaux, "with_property_income", 0, 1)
          result_nimes = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_nimes, "with_property_income", 0, 1)
          result_lille = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_lille, "with_property_income", 0, 1)
          result_agen = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_agen, "with_property_income", 0, 1)
          result_grenoble = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_grenoble, "with_property_income", 0, 1)
          result_toulouse = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_toulouse, "with_property_income", 0, 1)
          result_limoges = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_limoges, "with_property_income", 0, 1)
          result_rennes = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_rennes, "with_property_income", 0, 1)
          result_tours = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_tours, "with_property_income", 0, 1)
          result_toulon = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_toulon, "with_property_income", 0, 1)
          result_la_ciotat = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_la_ciotat, "with_property_income", 0, 1)
          expect(result_lyon[:discount_on_low_income_tax_amount]).to be_within(0.01).of(0)
          expect(result_bordeaux[:discount_on_low_income_tax_amount]).to be_within(0.01).of(645.86)
          expect(result_nimes[:discount_on_low_income_tax_amount]).to be_within(0.01).of(0)
          expect(result_lille[:discount_on_low_income_tax_amount]).to be_within(0.01).of(0)
          expect(result_agen[:discount_on_low_income_tax_amount]).to be_within(0.01).of(0)
          expect(result_grenoble[:discount_on_low_income_tax_amount]).to be_within(0.01).of(0)
          expect(result_toulouse[:discount_on_low_income_tax_amount]).to be_within(0.01).of(83.36)
          expect(result_limoges[:discount_on_low_income_tax_amount]).to be_within(0.01).of(0)
          expect(result_rennes[:discount_on_low_income_tax_amount]).to be_within(0.01).of(0)
          expect(result_tours[:discount_on_low_income_tax_amount]).to be_within(0.01).of(0)
          expect(result_toulon[:discount_on_low_income_tax_amount]).to be_within(0.01).of(0)
          expect(result_la_ciotat[:discount_on_low_income_tax_amount]).to be_within(0.01).of(0)
        end
      end

      describe "#calc_global_net_taxable_amount(simulation, net_taxable_property_income)" do
        it "returns the net taxable amount" do
          result_lyon = FrenchTaxSystem.calc_global_net_taxable_amount(simulation_lyon, -10_700.00)
          result_bordeaux = FrenchTaxSystem.calc_global_net_taxable_amount(simulation_bordeaux, -739.08)
          result_nimes = FrenchTaxSystem.calc_global_net_taxable_amount(simulation_nimes, -10_700.00)
          result_lille = FrenchTaxSystem.calc_global_net_taxable_amount(simulation_lille, 2_705.34)
          result_agen = FrenchTaxSystem.calc_global_net_taxable_amount(simulation_agen, 18_630.08)
          result_grenoble = FrenchTaxSystem.calc_global_net_taxable_amount(simulation_grenoble, 387.60)
          result_toulouse = FrenchTaxSystem.calc_global_net_taxable_amount(simulation_toulouse, 3_470.28)
          result_limoges = FrenchTaxSystem.calc_global_net_taxable_amount(simulation_limoges, -6_969.20)
          result_rennes = FrenchTaxSystem.calc_global_net_taxable_amount(simulation_rennes, -10_700.00)
          result_tours = FrenchTaxSystem.calc_global_net_taxable_amount(simulation_tours, -9_529.44)
          result_toulon = FrenchTaxSystem.calc_global_net_taxable_amount(simulation_toulon, 20_815.20)
          result_la_ciotat = FrenchTaxSystem.calc_global_net_taxable_amount(simulation_la_ciotat, 8_758.40)
          expect(result_lyon).to be_within(0.01).of(79_300.00)
          expect(result_bordeaux).to be_within(0.01).of(53_260.92)
          expect(result_nimes).to be_within(0.01).of(119_800.00)
          expect(result_lille).to be_within(0.01).of(52_205.34)
          expect(result_agen).to be_within(0.01).of(118_630.08)
          expect(result_grenoble).to be_within(0.01).of(31_887.60)
          expect(result_toulouse).to be_within(0.01).of(25_970.28)
          expect(result_limoges).to be_within(0.01).of(173_030.80)
          expect(result_rennes).to be_within(0.01).of(34_300.00)
          expect(result_tours).to be_within(0.01).of(64_720.56)
          expect(result_toulon).to be_within(0.01).of(313_315.20)
          expect(result_la_ciotat).to be_within(0.01).of(175_258.40)
        end
      end

      describe "#calc_family_quotient_amount(global_net_taxable_income_amount, fiscal_nb_parts)" do
        context "for real fiscal parts" do
          it "returns the family quotient amount" do
            result_lyon = FrenchTaxSystem.calc_family_quotient_amount(79_300.00, 3.5)
            result_bordeaux = FrenchTaxSystem.calc_family_quotient_amount(53_260.92, 4)
            result_nimes = FrenchTaxSystem.calc_family_quotient_amount(119_800.00, 4.5)
            result_lille = FrenchTaxSystem.calc_family_quotient_amount(52_205.34, 3)
            result_agen = FrenchTaxSystem.calc_family_quotient_amount(118_630.08, 4)
            result_grenoble = FrenchTaxSystem.calc_family_quotient_amount(31_887.60, 1)
            result_toulouse = FrenchTaxSystem.calc_family_quotient_amount(25_970.28, 2.5)
            result_limoges = FrenchTaxSystem.calc_family_quotient_amount(173_030.80, 4.5)
            result_rennes = FrenchTaxSystem.calc_family_quotient_amount(34_300.00, 4)
            result_tours = FrenchTaxSystem.calc_family_quotient_amount(64_720.56, 2)
            result_toulon = FrenchTaxSystem.calc_family_quotient_amount(313_315.20, 4)
            result_la_ciotat = FrenchTaxSystem.calc_family_quotient_amount(175_258.40, 2.5)
            expect(result_lyon).to be_within(0.01).of(22_657.14)
            expect(result_bordeaux).to be_within(0.01).of(13_315.23)
            expect(result_nimes).to be_within(0.01).of(26_622.22)
            expect(result_lille).to be_within(0.01).of(17_401.78)
            expect(result_agen).to be_within(0.01).of(29_657.52)
            expect(result_grenoble).to be_within(0.01).of(31_887.60)
            expect(result_toulouse).to be_within(0.01).of(10_388.11)
            expect(result_limoges).to be_within(0.01).of(38_451.29)
            expect(result_rennes).to be_within(0.01).of(8_575.00)
            expect(result_tours).to be_within(0.01).of(32_360.28)
            expect(result_toulon).to be_within(0.01).of(78_328.80)
            expect(result_la_ciotat).to be_within(0.01).of(70_103.36)
          end
        end

        context "for fiscal parts capping" do
          it "returns the family quotient amount" do
            result_lyon = FrenchTaxSystem.calc_family_quotient_amount(79_300.00, 2)
            result_bordeaux = FrenchTaxSystem.calc_family_quotient_amount(53_260.92, 2)
            result_nimes = FrenchTaxSystem.calc_family_quotient_amount(119_800.00, 2)
            result_lille = FrenchTaxSystem.calc_family_quotient_amount(52_205.34, 1)
            result_agen = FrenchTaxSystem.calc_family_quotient_amount(118_630.08, 2)
            result_grenoble = FrenchTaxSystem.calc_family_quotient_amount(31_887.60, 1)
            result_toulouse = FrenchTaxSystem.calc_family_quotient_amount(25_970.28, 1)
            result_limoges = FrenchTaxSystem.calc_family_quotient_amount(173_030.80, 2)
            result_rennes = FrenchTaxSystem.calc_family_quotient_amount(34_300.00, 1)
            result_tours = FrenchTaxSystem.calc_family_quotient_amount(64_720.56, 2)
            result_toulon = FrenchTaxSystem.calc_family_quotient_amount(313_315.20, 2)
            result_la_ciotat = FrenchTaxSystem.calc_family_quotient_amount(175_258.40, 2)
            expect(result_lyon).to be_within(0.01).of(39_650.00)
            expect(result_bordeaux).to be_within(0.01).of(26_630.46)
            expect(result_nimes).to be_within(0.01).of(59_900.00)
            expect(result_lille).to be_within(0.01).of(52_205.34)
            expect(result_agen).to be_within(0.01).of(59_315.04)
            expect(result_grenoble).to be_within(0.01).of(31_887.60)
            expect(result_toulouse).to be_within(0.01).of(25_970.28)
            expect(result_limoges).to be_within(0.01).of(86_515.40)
            expect(result_rennes).to be_within(0.01).of(34_300.00)
            expect(result_tours).to be_within(0.01).of(32_360.28)
            expect(result_toulon).to be_within(0.01).of(156_657.60)
            expect(result_la_ciotat).to be_within(0.01).of(87_629.20)
          end
        end
      end

      describe "#calc_aggregated_tax_amount(family_quotient_amount, current_year)" do
        context "for real fiscal parts" do
          it "returns the aggregated tax amount" do
            current_year = Date.today.year
            result_lyon = FrenchTaxSystem.calc_aggregated_tax_amount(22_657.14, current_year)
            result_bordeaux = FrenchTaxSystem.calc_aggregated_tax_amount(13_315.23, current_year)
            result_nimes = FrenchTaxSystem.calc_aggregated_tax_amount(26_622.22, current_year)
            result_lille = FrenchTaxSystem.calc_aggregated_tax_amount(17_401.78, current_year)
            result_agen = FrenchTaxSystem.calc_aggregated_tax_amount(29_657.52, current_year)
            result_grenoble = FrenchTaxSystem.calc_aggregated_tax_amount(31_887.60, current_year)
            result_toulouse = FrenchTaxSystem.calc_aggregated_tax_amount(10_388.11, current_year)
            result_limoges = FrenchTaxSystem.calc_aggregated_tax_amount(38_451.29, current_year)
            result_rennes = FrenchTaxSystem.calc_aggregated_tax_amount(8_575.00, current_year)
            result_tours = FrenchTaxSystem.calc_aggregated_tax_amount(32_360.28, current_year)
            result_toulon = FrenchTaxSystem.calc_aggregated_tax_amount(78_328.80, current_year)
            result_la_ciotat = FrenchTaxSystem.calc_aggregated_tax_amount(70_103.36, current_year)
            expect(result_lyon).to be_within(0.01).of(1_382.9354)
            expect(result_bordeaux).to be_within(0.01).of(355.3253)
            expect(result_nimes).to be_within(0.01).of(1_992.116)
            expect(result_lille).to be_within(0.01).of(804.8458)
            expect(result_agen).to be_within(0.01).of(2_902.706)
            expect(result_grenoble).to be_within(0.01).of(3_571.73)
            expect(result_toulouse).to be_within(0.01).of(33.3421)
            expect(result_limoges).to be_within(0.01).of(5_540.837)
            expect(result_rennes).to be_within(0.01).of(0)
            expect(result_tours).to be_within(0.01).of(3_713.534)
            expect(result_toulon).to be_within(0.01).of(18_033.088)
            expect(result_la_ciotat).to be_within(0.01).of(15_036.458)
          end
        end

        context "for fiscal parts capping" do
          it "returns the aggregated tax amount" do
            current_year = Date.today.year
            result_lyon = FrenchTaxSystem.calc_aggregated_tax_amount(39_650.00, current_year)
            result_bordeaux = FrenchTaxSystem.calc_aggregated_tax_amount(26_630.46, current_year)
            result_nimes = FrenchTaxSystem.calc_aggregated_tax_amount(59_900.00, current_year)
            result_lille = FrenchTaxSystem.calc_aggregated_tax_amount(52_205.34, current_year)
            result_agen = FrenchTaxSystem.calc_aggregated_tax_amount(59_315.04, current_year)
            result_grenoble = FrenchTaxSystem.calc_aggregated_tax_amount(31_887.60, current_year)
            result_toulouse = FrenchTaxSystem.calc_aggregated_tax_amount(25_970.28, current_year)
            result_limoges = FrenchTaxSystem.calc_aggregated_tax_amount(86_515.40, current_year)
            result_rennes = FrenchTaxSystem.calc_aggregated_tax_amount(34_300.00, current_year)
            result_tours = FrenchTaxSystem.calc_aggregated_tax_amount(32_360.28, current_year)
            result_toulon = FrenchTaxSystem.calc_aggregated_tax_amount(156_657.60, current_year)
            result_la_ciotat = FrenchTaxSystem.calc_aggregated_tax_amount(87_629.20, current_year)
            expect(result_lyon).to be_within(0.01).of(5_900.45)
            expect(result_bordeaux).to be_within(0.01).of(1_994.588)
            expect(result_nimes).to be_within(0.01).of(11_975.45)
            expect(result_lille).to be_within(0.01).of(9_667.052)
            expect(result_agen).to be_within(0.01).of(11_799.962)
            expect(result_grenoble).to be_within(0.01).of(3_571.73)
            expect(result_toulouse).to be_within(0.01).of(1_796.534)
            expect(result_limoges).to be_within(0.01).of(21_389.594)
            expect(result_rennes).to be_within(0.01).of(4_295.45)
            expect(result_tours).to be_within(0.01).of(3_713.534)
            expect(result_toulon).to be_within(0.01).of(50_147.896)
            expect(result_la_ciotat).to be_within(0.01).of(21_846.252)
          end
        end
      end

      describe "#apply_fiscal_parts_capping(aggregated_tax_amount_for_real_fiscal_parts, fiscal_nb_parts, aggregated_tax_amount_for_fiscal_parts_capping, fiscal_nb_parts_for_capping, capping_due_to_fiscal_parts)" do
        it "returns previsional income tax with fiscal part capping effect" do
          result_lyon = FrenchTaxSystem.apply_fiscal_parts_capping(1_382.9354, 3.5, 5_900.45, 2, 4_710)
          result_bordeaux = FrenchTaxSystem.apply_fiscal_parts_capping(355.3253, 4, 1_994.588, 2, 6_280)
          result_nimes = FrenchTaxSystem.apply_fiscal_parts_capping(1_992.116, 4.5, 11_975.45, 2, 7_850)
          result_lille = FrenchTaxSystem.apply_fiscal_parts_capping(804.8458, 3, 9_667.052, 1, 6_844)
          result_agen = FrenchTaxSystem.apply_fiscal_parts_capping(2_902.706, 4, 11_799.962, 2, 6_280)
          result_grenoble = FrenchTaxSystem.apply_fiscal_parts_capping(3_571.73, 1, 3_571.73, 1, 0)
          result_toulouse = FrenchTaxSystem.apply_fiscal_parts_capping(33.3421, 2.5, 1_796.534, 1, 5_274)
          result_limoges = FrenchTaxSystem.apply_fiscal_parts_capping(5_540.837, 4.5, 21_389.594, 2, 7_850)
          result_rennes = FrenchTaxSystem.apply_fiscal_parts_capping(0, 4, 4_295.45, 1, 9_984)
          result_tours = FrenchTaxSystem.apply_fiscal_parts_capping(3_713.534, 2, 3_713.534, 2, 0)
          result_toulon = FrenchTaxSystem.apply_fiscal_parts_capping(18_033.088, 4, 50_147.896, 2, 6_280)
          result_la_ciotat = FrenchTaxSystem.apply_fiscal_parts_capping(15_036.458, 2.5, 21_846.252, 2, 1_570)
          expect(result_lyon).to be_within(0.01).of(7_090.90)
          expect(result_bordeaux).to be_within(0.01).of(1_421.30)
          expect(result_nimes).to be_within(0.01).of(16_100.90)
          expect(result_lille).to be_within(0.01).of(2_823.05)
          expect(result_agen).to be_within(0.01).of(17_319.92)
          expect(result_grenoble).to be_within(0.01).of(3_571.73)
          expect(result_toulouse).to be_within(0.01).of(83.36)
          expect(result_limoges).to be_within(0.01).of(34_929.19)
          expect(result_rennes).to be_within(0.01).of(0.00)
          expect(result_tours).to be_within(0.01).of(7_427.07)
          expect(result_toulon).to be_within(0.01).of(94_015.79)
          expect(result_la_ciotat).to be_within(0.01).of(42_122.50)
        end
      end

      describe "#apply_discount_on_low_income_tax(simulation, almost_final_income_tax, current_year)" do
        it "returns final tax income with the reduced income tax for low incomes" do
          current_year = Date.today.year

          result_lyon = FrenchTaxSystem.apply_discount_on_low_income_tax(simulation_lyon, 7_090.90, current_year)
          result_bordeaux = FrenchTaxSystem.apply_discount_on_low_income_tax(simulation_bordeaux, 1_421.30, current_year)
          result_nimes = FrenchTaxSystem.apply_discount_on_low_income_tax(simulation_nimes, 16_100.90, current_year)
          result_lille = FrenchTaxSystem.apply_discount_on_low_income_tax(simulation_lille, 2_823.05, current_year)
          result_agen = FrenchTaxSystem.apply_discount_on_low_income_tax(simulation_agen, 17_319.92, current_year)
          result_grenoble = FrenchTaxSystem.apply_discount_on_low_income_tax(simulation_grenoble, 3_571.73, current_year)
          result_toulouse = FrenchTaxSystem.apply_discount_on_low_income_tax(simulation_toulouse, 83.36, current_year)
          result_limoges = FrenchTaxSystem.apply_discount_on_low_income_tax(simulation_limoges, 34_929.19, current_year)
          result_rennes = FrenchTaxSystem.apply_discount_on_low_income_tax(simulation_rennes, 0.00, current_year)
          result_tours = FrenchTaxSystem.apply_discount_on_low_income_tax(simulation_tours, 7_427.07, current_year)
          result_toulon = FrenchTaxSystem.apply_discount_on_low_income_tax(simulation_toulon, 94_015.79, current_year)
          result_la_ciotat = FrenchTaxSystem.apply_discount_on_low_income_tax(simulation_la_ciotat, 42_122.50, current_year)
          expect(result_lyon).to be_within(0.01).of(7_090.90)
          expect(result_bordeaux).to be_within(0.01).of(775.43825) # Married couple household effect
          expect(result_nimes).to be_within(0.01).of(16_100.90)
          expect(result_lille).to be_within(0.01).of(2_823.05)
          expect(result_agen).to be_within(0.01).of(17_319.92)
          expect(result_grenoble).to be_within(0.01).of(3_571.73)
          expect(result_toulouse).to be_within(0.01).of(0) # Single person household effect
          expect(result_limoges).to be_within(0.01).of(34_929.19)
          expect(result_rennes).to be_within(0.01).of(0)
          expect(result_tours).to be_within(0.01).of(7_427.07)
          expect(result_toulon).to be_within(0.01).of(94_015.79)
          expect(result_la_ciotat).to be_within(0.01).of(42_122.50)
        end
      end
    end

    context "when year 2" do
      describe "#calc_taxes_amount_per_year(simulation, calculation_method, investment_top_fiscal_year)" do
        it "returns a nice array" do
          result_lyon = FrenchTaxSystem.calc_taxes_amount_per_year(simulation_lyon, "with_property_income", 10)
          result_bordeaux = FrenchTaxSystem.calc_taxes_amount_per_year(simulation_bordeaux, "with_property_income", 10)
          result_nimes = FrenchTaxSystem.calc_taxes_amount_per_year(simulation_nimes, "with_property_income", 10)
          result_lille = FrenchTaxSystem.calc_taxes_amount_per_year(simulation_lille, "with_property_income", 10)
          result_agen = FrenchTaxSystem.calc_taxes_amount_per_year(simulation_agen, "with_property_income", 10)
          result_grenoble = FrenchTaxSystem.calc_taxes_amount_per_year(simulation_grenoble, "with_property_income", 10)
          result_toulouse = FrenchTaxSystem.calc_taxes_amount_per_year(simulation_toulouse, "with_property_income", 10)
          result_limoges = FrenchTaxSystem.calc_taxes_amount_per_year(simulation_limoges, "with_property_income", 10)
          result_rennes = FrenchTaxSystem.calc_taxes_amount_per_year(simulation_rennes, "with_property_income", 10)
          result_tours = FrenchTaxSystem.calc_taxes_amount_per_year(simulation_tours, "with_property_income", 10)
          result_toulon = FrenchTaxSystem.calc_taxes_amount_per_year(simulation_toulon, "with_property_income", 10)
          result_la_ciotat = FrenchTaxSystem.calc_taxes_amount_per_year(simulation_la_ciotat, "with_property_income", 10)
          # Results should not change between fiscal years because it is only based on fiscal_revenues_p1 & 2
          expect(result_lyon).to be_a(Array)
          expect(result_bordeaux).to be_a(Array)
          expect(result_nimes).to be_a(Array)
          expect(result_lille).to be_a(Array)
          expect(result_agen).to be_a(Array)
          expect(result_grenoble).to be_a(Array)
          expect(result_toulouse).to be_a(Array)
          expect(result_limoges).to be_a(Array)
          expect(result_rennes).to be_a(Array)
          expect(result_tours).to be_a(Array)
          expect(result_toulon).to be_a(Array)
          expect(result_la_ciotat).to be_a(Array)
        end

        it "returns income tax params" do
          result_lyon = FrenchTaxSystem.calc_taxes_amount_per_year(simulation_lyon, "with_property_income", 10)
          result_bordeaux = FrenchTaxSystem.calc_taxes_amount_per_year(simulation_bordeaux, "with_property_income", 10)
          result_nimes = FrenchTaxSystem.calc_taxes_amount_per_year(simulation_nimes, "with_property_income", 10)
          result_lille = FrenchTaxSystem.calc_taxes_amount_per_year(simulation_lille, "with_property_income", 10)
          result_agen = FrenchTaxSystem.calc_taxes_amount_per_year(simulation_agen, "with_property_income", 10)
          result_grenoble = FrenchTaxSystem.calc_taxes_amount_per_year(simulation_grenoble, "with_property_income", 10)
          result_toulouse = FrenchTaxSystem.calc_taxes_amount_per_year(simulation_toulouse, "with_property_income", 10)
          result_limoges = FrenchTaxSystem.calc_taxes_amount_per_year(simulation_limoges, "with_property_income", 10)
          result_rennes = FrenchTaxSystem.calc_taxes_amount_per_year(simulation_rennes, "with_property_income", 10)
          result_tours = FrenchTaxSystem.calc_taxes_amount_per_year(simulation_tours, "with_property_income", 10)
          result_toulon = FrenchTaxSystem.calc_taxes_amount_per_year(simulation_toulon, "with_property_income", 10)
          result_la_ciotat = FrenchTaxSystem.calc_taxes_amount_per_year(simulation_la_ciotat, "with_property_income", 10)
          expect(result_lyon[1][:income_tax][:income_tax_amount]).to be_within(0.01).of(7_090.90) # Same year 1
          expect(result_bordeaux[1][:income_tax][:income_tax_amount]).to be_within(0.01).of(1_574.31325)
          expect(result_nimes[1][:income_tax][:income_tax_amount]).to be_within(0.01).of(16_100.90) # Same year 1
          expect(result_lille[1][:income_tax][:income_tax_amount]).to be_within(0.01).of(3_573.052)
          expect(result_agen[1][:income_tax][:income_tax_amount]).to be_within(0.01).of(17_319.92) # Same year 1
          expect(result_grenoble[1][:income_tax][:income_tax_amount]).to be_within(0.01).of(6_571.73)
          expect(result_toulouse[1][:income_tax][:income_tax_amount]).to be_within(0.01).of(0) # Same year 1
          expect(result_limoges[1][:income_tax][:income_tax_amount]).to be_within(0.01).of(37_799.188)
          expect(result_rennes[1][:income_tax][:income_tax_amount]).to be_within(0.01).of(0) # Income tax is less than 62 euros
          expect(result_tours[1][:income_tax][:income_tax_amount]).to be_within(0.01).of(14_927.068)
          expect(result_toulon[1][:income_tax][:income_tax_amount]).to be_within(0.01).of(94_015.79) # Same year 1
          expect(result_la_ciotat[1][:income_tax][:income_tax_amount]).to be_within(0.01).of(42_122.50) # Same year 1
        end

        it "returns social contribution amount equal to 0" do
          result_lyon = FrenchTaxSystem.calc_taxes_amount_per_year(simulation_lyon, "with_property_income", 10)
          result_bordeaux = FrenchTaxSystem.calc_taxes_amount_per_year(simulation_bordeaux, "with_property_income", 10)
          result_nimes = FrenchTaxSystem.calc_taxes_amount_per_year(simulation_nimes, "with_property_income", 10)
          result_lille = FrenchTaxSystem.calc_taxes_amount_per_year(simulation_lille, "with_property_income", 10)
          result_agen = FrenchTaxSystem.calc_taxes_amount_per_year(simulation_agen, "with_property_income", 10)
          result_grenoble = FrenchTaxSystem.calc_taxes_amount_per_year(simulation_grenoble, "with_property_income", 10)
          result_toulouse = FrenchTaxSystem.calc_taxes_amount_per_year(simulation_toulouse, "with_property_income", 10)
          result_limoges = FrenchTaxSystem.calc_taxes_amount_per_year(simulation_limoges, "with_property_income", 10)
          result_rennes = FrenchTaxSystem.calc_taxes_amount_per_year(simulation_rennes, "with_property_income", 10)
          result_tours = FrenchTaxSystem.calc_taxes_amount_per_year(simulation_tours, "with_property_income", 10)
          result_toulon = FrenchTaxSystem.calc_taxes_amount_per_year(simulation_toulon, "with_property_income", 10)
          result_la_ciotat = FrenchTaxSystem.calc_taxes_amount_per_year(simulation_la_ciotat, "with_property_income", 10)
          expect(result_lyon[1][:social_contributions_amount]).to be_within(0.01).of(0)
          expect(result_bordeaux[1][:social_contributions_amount]).to be_within(0.01).of(732.8782)
          expect(result_nimes[1][:social_contributions_amount]).to be_within(0.01).of(0)
          expect(result_lille[1][:social_contributions_amount]).to be_within(0.01).of(895.3185)
          expect(result_agen[1][:social_contributions_amount]).to be_within(0.01).of(3_204.3738)
          expect(result_grenoble[1][:social_contributions_amount]).to be_within(0.01).of(1_786.6672)
          expect(result_toulouse[1][:social_contributions_amount]).to be_within(0.01).of(596.8882)
          expect(result_limoges[1][:social_contributions_amount]).to be_within(0.01).of(3_101.2976)
          expect(result_rennes[1][:social_contributions_amount]).to be_within(0.01).of(0)
          expect(result_tours[1][:social_contributions_amount]).to be_within(0.01).of(2_660.9363)
          expect(result_toulon[1][:social_contributions_amount]).to be_within(0.01).of(3_580.2144)
          expect(result_la_ciotat[1][:social_contributions_amount]).to be_within(0.01).of(1_506.4448)
        end
      end

      describe "#calc_income_tax_amount_for_year(simulation, calculation_method, postponed_negative_taxable_property_income_from_previous_fiscal_year, investment_fiscal_year)" do
        it "returns a nice hash" do
          result_lyon = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_lyon, "with_property_income", 0, 1)
          result_bordeaux = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_bordeaux, "with_property_income", 0, 2)
          result_nimes = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_nimes, "with_property_income", 0, 3)
          result_lille = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_lille, "with_property_income", 0, 4)
          result_agen = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_agen, "with_property_income", 0, 5)
          result_grenoble = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_grenoble, "with_property_income", 0, 6)
          result_toulouse = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_toulouse, "with_property_income", 0, 7)
          result_limoges = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_limoges, "with_property_income", 0, 8)
          result_rennes = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_rennes, "with_property_income", 0, 9)
          result_tours = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_tours, "with_property_income", 0, 10)
          result_toulon = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_toulon, "with_property_income", 0, 11)
          result_la_ciotat = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_la_ciotat, "with_property_income", 0, 12)
          expect(result_lyon).to be_a(Hash)
          expect(result_bordeaux).to be_a(Hash)
          expect(result_nimes).to be_a(Hash)
          expect(result_lille).to be_a(Hash)
          expect(result_agen).to be_a(Hash)
          expect(result_grenoble).to be_a(Hash)
          expect(result_toulouse).to be_a(Hash)
          expect(result_limoges).to be_a(Hash)
          expect(result_rennes).to be_a(Hash)
          expect(result_tours).to be_a(Hash)
          expect(result_toulon).to be_a(Hash)
          expect(result_la_ciotat).to be_a(Hash)
        end

        it "returns household's fiscal parts number" do
          result_lyon = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_lyon, "with_property_income", 0, 1)
          result_bordeaux = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_bordeaux, "with_property_income", 0, 2)
          result_nimes = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_nimes, "with_property_income", 0, 3)
          result_lille = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_lille, "with_property_income", 0, 4)
          result_agen = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_agen, "with_property_income", 0, 5)
          result_grenoble = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_grenoble, "with_property_income", 0, 6)
          result_toulouse = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_toulouse, "with_property_income", 0, 7)
          result_limoges = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_limoges, "with_property_income", 0, 8)
          result_rennes = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_rennes, "with_property_income", 0, 9)
          result_tours = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_tours, "with_property_income", 0, 10)
          result_toulon = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_toulon, "with_property_income", 0, 11)
          result_la_ciotat = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_la_ciotat, "with_property_income", 0, 12)
          expect(result_lyon[:fiscal_nb_parts]).to eq(3.5)
          expect(result_bordeaux[:fiscal_nb_parts]).to eq(4)
          expect(result_nimes[:fiscal_nb_parts]).to eq(4.5)
          expect(result_lille[:fiscal_nb_parts]).to eq(3)
          expect(result_agen[:fiscal_nb_parts]).to eq(4)
          expect(result_grenoble[:fiscal_nb_parts]).to eq(1)
          expect(result_toulouse[:fiscal_nb_parts]).to eq(2.5)
          expect(result_limoges[:fiscal_nb_parts]).to eq(4.5)
          expect(result_rennes[:fiscal_nb_parts]).to eq(4)
          expect(result_tours[:fiscal_nb_parts]).to eq(2)
          expect(result_toulon[:fiscal_nb_parts]).to eq(4)
          expect(result_la_ciotat[:fiscal_nb_parts]).to eq(2.5)
        end

        it "returns the income tax" do
          result_lyon = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_lyon, "with_property_income", 21_707.91, 2)
          result_bordeaux = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_bordeaux, "with_property_income", 0, 2)
          result_nimes = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_nimes, "with_property_income", 71_421.46, 2)
          result_lille = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_lille, "with_property_income", 0, 2)
          result_agen = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_agen, "with_property_income", 0, 2)
          result_grenoble = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_grenoble, "with_property_income", 0, 2)
          result_toulouse = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_toulouse, "with_property_income", 0, 2)
          result_limoges = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_limoges, "with_property_income", 0, 2)
          result_rennes = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_rennes, "with_property_income", 21_786.17, 2)
          result_tours = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_tours, "with_property_income", 0, 2)
          result_toulon = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_toulon, "with_property_income", 0, 2)
          result_la_ciotat = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_la_ciotat, "with_property_income", 0, 2)
          expect(result_lyon[:income_tax_amount]).to be_within(0.01).of(7_090.90) # Same year 1
          expect(result_bordeaux[:income_tax_amount]).to be_within(0.01).of(1_574.31325)
          expect(result_nimes[:income_tax_amount]).to be_within(0.01).of(16_100.90) # Same year 1
          expect(result_lille[:income_tax_amount]).to be_within(0.01).of(3_573.052)
          expect(result_agen[:income_tax_amount]).to be_within(0.01).of(17_319.92) # Same year 1
          expect(result_grenoble[:income_tax_amount]).to be_within(0.01).of(6_571.73)
          expect(result_toulouse[:income_tax_amount]).to be_within(0.01).of(0) # Same year 1
          expect(result_limoges[:income_tax_amount]).to be_within(0.01).of(37_799.188)
          expect(result_rennes[:income_tax_amount]).to be_within(0.01).of(0) # Income tax is less than 62 euros
          expect(result_tours[:income_tax_amount]).to be_within(0.01).of(14_927.068)
          expect(result_toulon[:income_tax_amount]).to be_within(0.01).of(94_015.79) # Same year 1
          expect(result_la_ciotat[:income_tax_amount]).to be_within(0.01).of(42_122.50) # Same year 1
        end

        it "returns the average tax rate" do
          result_lyon = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_lyon, "with_property_income", 21_707.91, 2)
          result_bordeaux = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_bordeaux, "with_property_income", 0, 2)
          result_nimes = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_nimes, "with_property_income", 71_421.46, 2)
          result_lille = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_lille, "with_property_income", 0, 2)
          result_agen = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_agen, "with_property_income", 0, 2)
          result_grenoble = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_grenoble, "with_property_income", 0, 2)
          result_toulouse = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_toulouse, "with_property_income", 0, 2)
          result_limoges = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_limoges, "with_property_income", 0, 2)
          result_rennes = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_rennes, "with_property_income", 21_786.17, 2)
          result_tours = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_tours, "with_property_income", 0, 2)
          result_toulon = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_toulon, "with_property_income", 0, 2)
          result_la_ciotat = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_la_ciotat, "with_property_income", 0, 2)
          expect(result_lyon[:average_tax_rate]).to be_within(0.001).of(0.0894) # Same year 1
          expect(result_bordeaux[:average_tax_rate]).to be_within(0.001).of(0.0270)
          expect(result_nimes[:average_tax_rate]).to be_within(0.001).of(0.1344) # Same year 1
          expect(result_lille[:average_tax_rate]).to be_within(0.001).of(0.0653)
          expect(result_agen[:average_tax_rate]).to be_within(0.001).of(0.1460) # Same year 1
          expect(result_grenoble[:average_tax_rate]).to be_within(0.001).of(0.1569)
          expect(result_toulouse[:average_tax_rate]).to be_within(0.001).of(0.0000) # Same year 1
          expect(result_limoges[:average_tax_rate]).to be_within(0.001).of(0.1909)
          expect(result_rennes[:average_tax_rate]).to be_within(0.001).of(0.0000)
          expect(result_tours[:average_tax_rate]).to be_within(0.001).of(0.1664)
          expect(result_toulon[:average_tax_rate]).to be_within(0.001).of(0.3001) # Same year 1
          expect(result_la_ciotat[:average_tax_rate]).to be_within(0.001).of(0.2403) # Same year 1
        end

        it "returns the global net taxable amount" do
          result_lyon = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_lyon, "with_property_income", 21_707.91, 2)
          result_bordeaux = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_bordeaux, "with_property_income", 0, 2)
          result_nimes = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_nimes, "with_property_income", 71_421.46, 2)
          result_lille = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_lille, "with_property_income", 0, 2)
          result_agen = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_agen, "with_property_income", 0, 2)
          result_grenoble = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_grenoble, "with_property_income", 0, 2)
          result_toulouse = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_toulouse, "with_property_income", 0, 2)
          result_limoges = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_limoges, "with_property_income", 0, 2)
          result_rennes = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_rennes, "with_property_income", 21_786.17, 2)
          result_tours = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_tours, "with_property_income", 0, 2)
          result_toulon = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_toulon, "with_property_income", 0, 2)
          result_la_ciotat = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_la_ciotat, "with_property_income", 0, 2)
          expect(result_lyon[:global_net_taxable_income_amount]).to be_within(0.01).of(79_300.00) # Same year 1
          expect(result_bordeaux[:global_net_taxable_income_amount]).to be_within(0.01).of(58_260.92)
          expect(result_nimes[:global_net_taxable_income_amount]).to be_within(0.01).of(119_800.00) # Same year 1
          expect(result_lille[:global_net_taxable_income_amount]).to be_within(0.01).of(54_705.34)
          expect(result_agen[:global_net_taxable_income_amount]).to be_within(0.01).of(118_630.08) # Same year 1
          expect(result_grenoble[:global_net_taxable_income_amount]).to be_within(0.01).of(41_887.60)
          expect(result_toulouse[:global_net_taxable_income_amount]).to be_within(0.01).of(25_970.28) # Same year 1
          expect(result_limoges[:global_net_taxable_income_amount]).to be_within(0.01).of(198_030.80)
          expect(result_rennes[:global_net_taxable_income_amount]).to be_within(0.01).of(40_727.66)
          expect(result_tours[:global_net_taxable_income_amount]).to be_within(0.01).of(89_720.56)
          expect(result_toulon[:global_net_taxable_income_amount]).to be_within(0.01).of(313_315.20) # Same year 1
          expect(result_la_ciotat[:global_net_taxable_income_amount]).to be_within(0.01).of(175_258.40) # Same year 1
        end

        it "returns the net property taxable amount" do
          result_lyon = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_lyon, "with_property_income", 21_707.91, 2)
          result_bordeaux = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_bordeaux, "with_property_income", 0, 2)
          result_nimes = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_nimes, "with_property_income", 71_421.46, 2)
          result_lille = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_lille, "with_property_income", 0, 2)
          result_agen = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_agen, "with_property_income", 0, 2)
          result_grenoble = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_grenoble, "with_property_income", 0, 2)
          result_toulouse = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_toulouse, "with_property_income", 0, 2)
          result_limoges = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_limoges, "with_property_income", 0, 2)
          result_rennes = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_rennes, "with_property_income", 21_786.17, 2)
          result_tours = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_tours, "with_property_income", 0, 2)
          result_toulon = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_toulon, "with_property_income", 0, 2)
          result_la_ciotat = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_la_ciotat, "with_property_income", 0, 2)
          expect(result_lyon[:net_taxable_property_income_amount]).to be_within(0.01).of(-10_700.00) # Same year 1
          expect(result_bordeaux[:net_taxable_property_income_amount]).to be_within(0.01).of(4_260.92)
          expect(result_nimes[:net_taxable_property_income_amount]).to be_within(0.01).of(-10_700.00) # Same year 1
          expect(result_lille[:net_taxable_property_income_amount]).to be_within(0.01).of(5_205.34)
          expect(result_agen[:net_taxable_property_income_amount]).to be_within(0.01).of(18_630.08) # Same year 1
          expect(result_grenoble[:net_taxable_property_income_amount]).to be_within(0.01).of(10_387.60)
          expect(result_toulouse[:net_taxable_property_income_amount]).to be_within(0.01).of(3_470.28) # Same year 1
          expect(result_limoges[:net_taxable_property_income_amount]).to be_within(0.01).of(18_030.80)
          expect(result_rennes[:net_taxable_property_income_amount]).to be_within(0.01).of(-4_272.34)
          expect(result_tours[:net_taxable_property_income_amount]).to be_within(0.01).of(15_470.56)
          expect(result_toulon[:net_taxable_property_income_amount]).to be_within(0.01).of(20_815.20) # Same year 1
          expect(result_la_ciotat[:net_taxable_property_income_amount]).to be_within(0.01).of(8_758.40) # Same year 1
        end

        it "returns true if there is a negative taxable property income" do
          result_lyon = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_lyon, "with_property_income", 21_707.91, 2)
          result_bordeaux = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_bordeaux, "with_property_income", 0, 2)
          result_nimes = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_nimes, "with_property_income", 71_421.46, 2)
          result_lille = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_lille, "with_property_income", 0, 2)
          result_agen = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_agen, "with_property_income", 0, 2)
          result_grenoble = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_grenoble, "with_property_income", 0, 2)
          result_toulouse = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_toulouse, "with_property_income", 0, 2)
          result_limoges = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_limoges, "with_property_income", 0, 2)
          result_rennes = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_rennes, "with_property_income", 21_786.17, 2)
          result_tours = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_tours, "with_property_income", 0, 2)
          result_toulon = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_toulon, "with_property_income", 0, 2)
          result_la_ciotat = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_la_ciotat, "with_property_income", 0, 2)
          expect(result_lyon[:negative_taxable_property_income?]).to eq(true) # Same year 1
          expect(result_bordeaux[:negative_taxable_property_income?]).to eq(false)
          expect(result_nimes[:negative_taxable_property_income?]).to eq(true) # Same year 1
          expect(result_lille[:negative_taxable_property_income?]).to eq(false)
          expect(result_agen[:negative_taxable_property_income?]).to eq(false) # Same year 1
          expect(result_grenoble[:negative_taxable_property_income?]).to eq(false)
          expect(result_toulouse[:negative_taxable_property_income?]).to eq(false) # Same year 1
          expect(result_limoges[:negative_taxable_property_income?]).to eq(false)
          expect(result_rennes[:negative_taxable_property_income?]).to eq(true)
          expect(result_tours[:negative_taxable_property_income?]).to eq(false)
          expect(result_toulon[:negative_taxable_property_income?]).to eq(false) # Same year 1
          expect(result_la_ciotat[:negative_taxable_property_income?]).to eq(false) # Same year 1
        end

        it "returns the negative taxable property income amount postponed to the next fiscal year" do
          result_lyon = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_lyon, "with_property_income", 21_707.91, 2)
          result_bordeaux = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_bordeaux, "with_property_income", 0, 2)
          result_nimes = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_nimes, "with_property_income", 71_421.46, 2)
          result_lille = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_lille, "with_property_income", 0, 2)
          result_agen = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_agen, "with_property_income", 0, 2)
          result_grenoble = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_grenoble, "with_property_income", 0, 2)
          result_toulouse = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_toulouse, "with_property_income", 0, 2)
          result_limoges = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_limoges, "with_property_income", 0, 2)
          result_rennes = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_rennes, "with_property_income", 21_786.17, 2)
          result_tours = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_tours, "with_property_income", 0, 2)
          result_toulon = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_toulon, "with_property_income", 0, 2)
          result_la_ciotat = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_la_ciotat, "with_property_income", 0, 2)
          expect(result_lyon[:negative_taxable_property_income_amount_to_postpone]).to be_within(0.01).of(3_415.82)
          expect(result_bordeaux[:negative_taxable_property_income_amount_to_postpone]).to be_within(0.01).of(0)
          expect(result_nimes[:negative_taxable_property_income_amount_to_postpone]).to be_within(0.01).of(17_842.92)
          expect(result_lille[:negative_taxable_property_income_amount_to_postpone]).to be_within(0.01).of(0)
          expect(result_agen[:negative_taxable_property_income_amount_to_postpone]).to be_within(0.01).of(0)
          expect(result_grenoble[:negative_taxable_property_income_amount_to_postpone]).to be_within(0.01).of(0)
          expect(result_toulouse[:negative_taxable_property_income_amount_to_postpone]).to be_within(0.01).of(0)
          expect(result_limoges[:negative_taxable_property_income_amount_to_postpone]).to be_within(0.01).of(0)
          expect(result_rennes[:negative_taxable_property_income_amount_to_postpone]).to be_within(0.01).of(0)
          expect(result_tours[:negative_taxable_property_income_amount_to_postpone]).to be_within(0.01).of(0)
          expect(result_toulon[:negative_taxable_property_income_amount_to_postpone]).to be_within(0.01).of(0)
          expect(result_la_ciotat[:negative_taxable_property_income_amount_to_postpone]).to be_within(0.01).of(0)
        end

        it "returns the discount amount on income tax for low income household" do
          result_lyon = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_lyon, "with_property_income", 21_707.91, 2)
          result_bordeaux = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_bordeaux, "with_property_income", 0, 2)
          result_nimes = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_nimes, "with_property_income", 71_421.46, 2)
          result_lille = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_lille, "with_property_income", 0, 2)
          result_agen = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_agen, "with_property_income", 0, 2)
          result_grenoble = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_grenoble, "with_property_income", 0, 2)
          result_toulouse = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_toulouse, "with_property_income", 0, 2)
          result_limoges = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_limoges, "with_property_income", 0, 2)
          result_rennes = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_rennes, "with_property_income", 21_786.17, 2)
          result_tours = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_tours, "with_property_income", 0, 2)
          result_toulon = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_toulon, "with_property_income", 0, 2)
          result_la_ciotat = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_la_ciotat, "with_property_income", 0, 2)
          expect(result_lyon[:discount_on_low_income_tax_amount]).to be_within(0.01).of(0)
          expect(result_bordeaux[:discount_on_low_income_tax_amount]).to be_within(0.01).of(396.99)
          expect(result_nimes[:discount_on_low_income_tax_amount]).to be_within(0.01).of(0)
          expect(result_lille[:discount_on_low_income_tax_amount]).to be_within(0.01).of(0)
          expect(result_agen[:discount_on_low_income_tax_amount]).to be_within(0.01).of(0)
          expect(result_grenoble[:discount_on_low_income_tax_amount]).to be_within(0.01).of(0)
          expect(result_toulouse[:discount_on_low_income_tax_amount]).to be_within(0.01).of(83.36)
          expect(result_limoges[:discount_on_low_income_tax_amount]).to be_within(0.01).of(0)
          expect(result_rennes[:discount_on_low_income_tax_amount]).to be_within(0.01).of(42.64)
          expect(result_tours[:discount_on_low_income_tax_amount]).to be_within(0.01).of(0)
          expect(result_toulon[:discount_on_low_income_tax_amount]).to be_within(0.01).of(0)
          expect(result_la_ciotat[:discount_on_low_income_tax_amount]).to be_within(0.01).of(0)
        end
      end

      describe "#calc_global_net_taxable_amount(simulation, net_taxable_property_income)" do
        it "returns the net taxable amount" do
          result_lyon = FrenchTaxSystem.calc_global_net_taxable_amount(simulation_lyon, -10_700.00) # Same as year 1
          result_bordeaux = FrenchTaxSystem.calc_global_net_taxable_amount(simulation_bordeaux, 4_260.92)
          result_nimes = FrenchTaxSystem.calc_global_net_taxable_amount(simulation_nimes, -10_700.00) # Same as year 1
          result_lille = FrenchTaxSystem.calc_global_net_taxable_amount(simulation_lille, 5_205.34)
          result_agen = FrenchTaxSystem.calc_global_net_taxable_amount(simulation_agen, 18_630.08) # Same as year 1
          result_grenoble = FrenchTaxSystem.calc_global_net_taxable_amount(simulation_grenoble, 10_387.60)
          result_toulouse = FrenchTaxSystem.calc_global_net_taxable_amount(simulation_toulouse, 3_470.28) # Same as year 1
          result_limoges = FrenchTaxSystem.calc_global_net_taxable_amount(simulation_limoges, 18_030.80)
          result_rennes = FrenchTaxSystem.calc_global_net_taxable_amount(simulation_rennes, -4_272.34)
          result_tours = FrenchTaxSystem.calc_global_net_taxable_amount(simulation_tours, 15_470.56)
          result_toulon = FrenchTaxSystem.calc_global_net_taxable_amount(simulation_toulon, 20_815.20) # Same as year 1
          result_la_ciotat = FrenchTaxSystem.calc_global_net_taxable_amount(simulation_la_ciotat, 8_758.40) # Same as year 1
          expect(result_lyon).to be_within(0.01).of(79_300.00) # Same as year 1
          expect(result_bordeaux).to be_within(0.01).of(58_260.92)
          expect(result_nimes).to be_within(0.01).of(119_800.00) # Same as year 1
          expect(result_lille).to be_within(0.01).of(54_705.34)
          expect(result_agen).to be_within(0.01).of(118_630.08) # Same as year 1
          expect(result_grenoble).to be_within(0.01).of(41_887.60)
          expect(result_toulouse).to be_within(0.01).of(25_970.28) # Same as year 1
          expect(result_limoges).to be_within(0.01).of(198_030.80)
          expect(result_rennes).to be_within(0.01).of(40_727.66)
          expect(result_tours).to be_within(0.01).of(89_720.56)
          expect(result_toulon).to be_within(0.01).of(313_315.20) # Same as year 1
          expect(result_la_ciotat).to be_within(0.01).of(175_258.40) # Same as year 1
        end
      end

      describe "#calc_family_quotient_amount(global_net_taxable_income_amount, fiscal_nb_parts)" do
        context "for real fiscal parts" do
          it "returns the family quotient amount" do
            result_lyon = FrenchTaxSystem.calc_family_quotient_amount(79_300.00, 3.5)
            result_bordeaux = FrenchTaxSystem.calc_family_quotient_amount(58_260.92, 4)
            result_nimes = FrenchTaxSystem.calc_family_quotient_amount(119_800.00, 4.5)
            result_lille = FrenchTaxSystem.calc_family_quotient_amount(54_705.34, 3)
            result_agen = FrenchTaxSystem.calc_family_quotient_amount(118_630.08, 4)
            result_grenoble = FrenchTaxSystem.calc_family_quotient_amount(41_887.60, 1)
            result_toulouse = FrenchTaxSystem.calc_family_quotient_amount(25_970.28, 2.5)
            result_limoges = FrenchTaxSystem.calc_family_quotient_amount(198_030.80, 4.5)
            result_rennes = FrenchTaxSystem.calc_family_quotient_amount(40_727.66, 4)
            result_tours = FrenchTaxSystem.calc_family_quotient_amount(89_720.56, 2)
            result_toulon = FrenchTaxSystem.calc_family_quotient_amount(313_315.20, 4)
            result_la_ciotat = FrenchTaxSystem.calc_family_quotient_amount(175_258.40, 2.5)
            expect(result_lyon).to be_within(0.01).of(22_657.14)
            expect(result_bordeaux).to be_within(0.01).of(14_565.23)
            expect(result_nimes).to be_within(0.01).of(26_622.22)
            expect(result_lille).to be_within(0.01).of(18_235.11)
            expect(result_agen).to be_within(0.01).of(29_657.52)
            expect(result_grenoble).to be_within(0.01).of(41_887.60)
            expect(result_toulouse).to be_within(0.01).of(10_388.11)
            expect(result_limoges).to be_within(0.01).of(44_006.84)
            expect(result_rennes).to be_within(0.01).of(10_181.92)
            expect(result_tours).to be_within(0.01).of(44_860.28)
            expect(result_toulon).to be_within(0.01).of(78_328.80)
            expect(result_la_ciotat).to be_within(0.01).of(70_103.36)
          end
        end

        context "for fiscal parts capping" do
          it "returns the family quotient amount" do
            result_lyon = FrenchTaxSystem.calc_family_quotient_amount(79_300.00, 2)
            result_bordeaux = FrenchTaxSystem.calc_family_quotient_amount(58_260.92, 2)
            result_nimes = FrenchTaxSystem.calc_family_quotient_amount(119_800.00, 2)
            result_lille = FrenchTaxSystem.calc_family_quotient_amount(54_705.34, 1)
            result_agen = FrenchTaxSystem.calc_family_quotient_amount(118_630.08, 2)
            result_grenoble = FrenchTaxSystem.calc_family_quotient_amount(41_887.60, 1)
            result_toulouse = FrenchTaxSystem.calc_family_quotient_amount(25_970.28, 1)
            result_limoges = FrenchTaxSystem.calc_family_quotient_amount(198_030.80, 2)
            result_rennes = FrenchTaxSystem.calc_family_quotient_amount(40_727.66, 1)
            result_tours = FrenchTaxSystem.calc_family_quotient_amount(89_720.56, 2)
            result_toulon = FrenchTaxSystem.calc_family_quotient_amount(313_315.20, 2)
            result_la_ciotat = FrenchTaxSystem.calc_family_quotient_amount(175_258.40, 2)
            expect(result_lyon).to be_within(0.01).of(39_650.00)
            expect(result_bordeaux).to be_within(0.01).of(29_130.46)
            expect(result_nimes).to be_within(0.01).of(59_900.00)
            expect(result_lille).to be_within(0.01).of(54_705.34)
            expect(result_agen).to be_within(0.01).of(59_315.04)
            expect(result_grenoble).to be_within(0.01).of(41_887.60)
            expect(result_toulouse).to be_within(0.01).of(25_970.28)
            expect(result_limoges).to be_within(0.01).of(99_015.40)
            expect(result_rennes).to be_within(0.01).of(40_727.66)
            expect(result_tours).to be_within(0.01).of(44_860.28)
            expect(result_toulon).to be_within(0.01).of(156_657.60)
            expect(result_la_ciotat).to be_within(0.01).of(87_629.20)
          end
        end
      end

      describe "#calc_aggregated_tax_amount(family_quotient_amount, current_year)" do
        context "for real fiscal parts" do
          it "returns the aggregated tax amount" do
            current_year = Date.today.year
            result_lyon = FrenchTaxSystem.calc_aggregated_tax_amount(22_657.14, current_year) # Same year 1
            result_bordeaux = FrenchTaxSystem.calc_aggregated_tax_amount(14_565.23, current_year)
            result_nimes = FrenchTaxSystem.calc_aggregated_tax_amount(26_622.22, current_year) # Same year 1
            result_lille = FrenchTaxSystem.calc_aggregated_tax_amount(18_231.11, current_year)
            result_agen = FrenchTaxSystem.calc_aggregated_tax_amount(29_657.52, current_year) # Same year 1
            result_grenoble = FrenchTaxSystem.calc_aggregated_tax_amount(41_887.60, current_year)
            result_toulouse = FrenchTaxSystem.calc_aggregated_tax_amount(10_388.11, current_year) # Same year 1
            result_limoges = FrenchTaxSystem.calc_aggregated_tax_amount(44_006.84, current_year)
            result_rennes = FrenchTaxSystem.calc_aggregated_tax_amount(10_181.92, current_year)
            result_tours = FrenchTaxSystem.calc_aggregated_tax_amount(44_860.28, current_year)
            result_toulon = FrenchTaxSystem.calc_aggregated_tax_amount(78_328.80, current_year) # Same year 1
            result_la_ciotat = FrenchTaxSystem.calc_aggregated_tax_amount(70_103.36, current_year) # Same year 1
            expect(result_lyon).to be_within(0.01).of(1_382.9354) # Same year 1
            expect(result_bordeaux).to be_within(0.01).of(492.8253)
            expect(result_nimes).to be_within(0.01).of(1_992.116) # Same year 1
            expect(result_lille).to be_within(0.01).of(896.0721)
            expect(result_agen).to be_within(0.01).of(2_902.706) # Same year 1
            expect(result_grenoble).to be_within(0.01).of(6_571.73)
            expect(result_toulouse).to be_within(0.01).of(33.3421) # Same year 1
            expect(result_limoges).to be_within(0.01).of(7_207.502)
            expect(result_rennes).to be_within(0.01).of(10.6612)
            expect(result_tours).to be_within(0.01).of(7_463.534)
            expect(result_toulon).to be_within(0.01).of(18_033.088) # Same year 1
            expect(result_la_ciotat).to be_within(0.01).of(15_036.458) # Same year 1
          end
        end

        context "for fiscal parts capping" do
          it "returns the aggregated tax amount" do
            current_year = Date.today.year
            result_lyon = FrenchTaxSystem.calc_aggregated_tax_amount(39_650.00, current_year) # Same year 1
            result_bordeaux = FrenchTaxSystem.calc_aggregated_tax_amount(29_130.46, current_year)
            result_nimes = FrenchTaxSystem.calc_aggregated_tax_amount(59_900.00, current_year) # Same year 1
            result_lille = FrenchTaxSystem.calc_aggregated_tax_amount(54_705.34, current_year)
            result_agen = FrenchTaxSystem.calc_aggregated_tax_amount(59_315.04, current_year) # Same year 1
            result_grenoble = FrenchTaxSystem.calc_aggregated_tax_amount(41_887.60, current_year)
            result_toulouse = FrenchTaxSystem.calc_aggregated_tax_amount(25_970.28, current_year) # Same year 1
            result_limoges = FrenchTaxSystem.calc_aggregated_tax_amount(90_015.40, current_year)
            result_rennes = FrenchTaxSystem.calc_aggregated_tax_amount(40_727.66, current_year)
            result_tours = FrenchTaxSystem.calc_aggregated_tax_amount(44_860.28, current_year)
            result_toulon = FrenchTaxSystem.calc_aggregated_tax_amount(156_657.60, current_year) # Same year 1
            result_la_ciotat = FrenchTaxSystem.calc_aggregated_tax_amount(87_629.20, current_year) # Same year 1
            expect(result_lyon).to be_within(0.01).of(5_900.45) # Same year 1
            expect(result_bordeaux).to be_within(0.01).of(2_744.588)
            expect(result_nimes).to be_within(0.01).of(11_975.45) # Same year 1
            expect(result_lille).to be_within(0.01).of(10_417.052)
            expect(result_agen).to be_within(0.01).of(11_799.962) # Same year 1
            expect(result_grenoble).to be_within(0.01).of(6_571.73)
            expect(result_toulouse).to be_within(0.01).of(1_796.534) # Same year 1
            expect(result_limoges).to be_within(0.01).of(22_824.594)
            expect(result_rennes).to be_within(0.01).of(6_223.748)
            expect(result_tours).to be_within(0.01).of(7_463.534)
            expect(result_toulon).to be_within(0.01).of(50_147.896) # Same year 1
            expect(result_la_ciotat).to be_within(0.01).of(21_846.252) # Same year 1
          end
        end
      end

      describe "#apply_fiscal_parts_capping(aggregated_tax_amount_for_real_fiscal_parts, fiscal_nb_parts, aggregated_tax_amount_for_fiscal_parts_capping, fiscal_nb_parts_for_capping, capping_due_to_fiscal_parts)" do
        it "returns previsional income tax with fiscal part capping effect" do
          result_lyon = FrenchTaxSystem.apply_fiscal_parts_capping(1_382.9354, 3.5, 5_900.45, 2, 4_710) # Same year 1
          result_bordeaux = FrenchTaxSystem.apply_fiscal_parts_capping(492.8253, 4, 2_744.588, 2, 6_280)
          result_nimes = FrenchTaxSystem.apply_fiscal_parts_capping(1_992.116, 4.5, 11_975.45, 2, 7_850) # Same year 1
          result_lille = FrenchTaxSystem.apply_fiscal_parts_capping(896.0721, 3, 10_417.052, 1, 6_844)
          result_agen = FrenchTaxSystem.apply_fiscal_parts_capping(2_902.706, 4, 11_799.962, 2, 6_280) # Same year 1
          result_grenoble = FrenchTaxSystem.apply_fiscal_parts_capping(6_571.73, 1, 6_571.73, 1, 0)
          result_toulouse = FrenchTaxSystem.apply_fiscal_parts_capping(33.3421, 2.5, 1_796.534, 1, 5_274) # Same year 1
          result_limoges = FrenchTaxSystem.apply_fiscal_parts_capping(7_207.502, 4.5, 22_824.594, 2, 7_850)
          result_rennes = FrenchTaxSystem.apply_fiscal_parts_capping(10.6612, 4, 6_223.748, 1, 9_984)
          result_tours = FrenchTaxSystem.apply_fiscal_parts_capping(7_463.534, 2, 7_463.534, 2, 0)
          result_toulon = FrenchTaxSystem.apply_fiscal_parts_capping(18_033.088, 4, 50_147.896, 2, 6_280) # Same year 1
          result_la_ciotat = FrenchTaxSystem.apply_fiscal_parts_capping(15_036.458, 2.5, 21_846.252, 2, 1_570) # Same year 1
          expect(result_lyon).to be_within(0.01).of(7_090.90) # Same year 1
          expect(result_bordeaux).to be_within(0.01).of(1_971.30)
          expect(result_nimes).to be_within(0.01).of(16_100.90) # Same year 1
          expect(result_lille).to be_within(0.01).of(3_573.05)
          expect(result_agen).to be_within(0.01).of(17_319.92) # Same year 1
          expect(result_grenoble).to be_within(0.01).of(6_571.73)
          expect(result_toulouse).to be_within(0.01).of(83.36) # Same year 1
          expect(result_limoges).to be_within(0.01).of(37_799.19)
          expect(result_rennes).to be_within(0.01).of(42.64)
          expect(result_tours).to be_within(0.01).of(14_927.07)
          expect(result_toulon).to be_within(0.01).of(94_015.79) # Same year 1
          expect(result_la_ciotat).to be_within(0.01).of(42_122.50) # Same year 1
        end
      end

      describe "#apply_discount_on_low_income_tax(simulation, almost_final_income_tax, current_year)" do
        it "returns final tax income with the reduced income tax for low incomes" do
          current_year = Date.today.year

          result_lyon = FrenchTaxSystem.apply_discount_on_low_income_tax(simulation_lyon, 7_090.90, current_year) # Same year 1
          result_bordeaux = FrenchTaxSystem.apply_discount_on_low_income_tax(simulation_bordeaux, 1_971.30, current_year)
          result_nimes = FrenchTaxSystem.apply_discount_on_low_income_tax(simulation_nimes, 16_100.90, current_year) # Same year 1
          result_lille = FrenchTaxSystem.apply_discount_on_low_income_tax(simulation_lille, 3_573.05, current_year)
          result_agen = FrenchTaxSystem.apply_discount_on_low_income_tax(simulation_agen, 17_319.92, current_year) # Same year 1
          result_grenoble = FrenchTaxSystem.apply_discount_on_low_income_tax(simulation_grenoble, 6_571.73, current_year)
          result_toulouse = FrenchTaxSystem.apply_discount_on_low_income_tax(simulation_toulouse, 83.36, current_year) # Same year 1
          result_limoges = FrenchTaxSystem.apply_discount_on_low_income_tax(simulation_limoges, 37_799.19, current_year)
          result_rennes = FrenchTaxSystem.apply_discount_on_low_income_tax(simulation_rennes, 42.64, current_year)
          result_tours = FrenchTaxSystem.apply_discount_on_low_income_tax(simulation_tours, 14_927.07, current_year)
          result_toulon = FrenchTaxSystem.apply_discount_on_low_income_tax(simulation_toulon, 94_015.79, current_year) # Same year 1
          result_la_ciotat = FrenchTaxSystem.apply_discount_on_low_income_tax(simulation_la_ciotat, 42_122.50, current_year) # Same year 1
          expect(result_lyon).to be_within(0.01).of(7_090.90) # Same year 1
          expect(result_bordeaux).to be_within(0.01).of(1_574.31325) # Married couple household effect
          expect(result_nimes).to be_within(0.01).of(16_100.90) # Same year 1
          expect(result_lille).to be_within(0.01).of(3_573.05)
          expect(result_agen).to be_within(0.01).of(17_319.92) # Same year 1
          expect(result_grenoble).to be_within(0.01).of(6_571.73)
          expect(result_toulouse).to be_within(0.01).of(0) # Same year 1
          expect(result_limoges).to be_within(0.01).of(37_799.19)
          expect(result_rennes).to be_within(0.01).of(0) # Single person household effect
          expect(result_tours).to be_within(0.01).of(14_927.07)
          expect(result_toulon).to be_within(0.01).of(94_015.79) # Same year 1
          expect(result_la_ciotat).to be_within(0.01).of(42_122.50) # Same year 1
        end
      end
    end
  end
end
