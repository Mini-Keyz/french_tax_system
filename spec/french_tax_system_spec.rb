# frozen_string_literal: true

RSpec.describe FrenchTaxSystem do
  it "has a version number" do
    expect(FrenchTaxSystem::VERSION).not_to be nil
  end

  let(:simulation_lyon) do
    {
      fiscal_revenues_p1: 75_000,
      fiscal_revenues_p2: 25_000,
      fiscal_marital_status: "Marié / Pacsé",
      fiscal_nb_dependent_children: 2,
      fiscal_nb_alternate_custody_children: 1
    }
  end

  let(:simulation_bordeaux) do
    {
      fiscal_revenues_p1: 25_000,
      fiscal_revenues_p2: 35_000,
      fiscal_marital_status: "Marié / Pacsé",
      fiscal_nb_dependent_children: 3,
      fiscal_nb_alternate_custody_children: 0
    }
  end

  let(:simulation_nimes) do
    {
      fiscal_revenues_p1: 80_000,
      fiscal_revenues_p2: 65_000,
      fiscal_marital_status: "Marié / Pacsé",
      fiscal_nb_dependent_children: 2,
      fiscal_nb_alternate_custody_children: 3
    }
  end

  let(:simulation_lille) do
    {
      fiscal_revenues_p1: 55_000,
      fiscal_marital_status: "Célibataire",
      fiscal_nb_dependent_children: 0,
      fiscal_nb_alternate_custody_children: 4
    }
  end

  let(:simulation_agen) do
    {
      fiscal_revenues_p1: 61_111.11,
      fiscal_revenues_p2: 50_000,
      fiscal_marital_status: "Marié / Pacsé",
      fiscal_nb_dependent_children: 3,
      fiscal_nb_alternate_custody_children: 0
    }
  end

  let(:simulation_grenoble) do
    {
      fiscal_revenues_p1: 35_000,
      fiscal_marital_status: "Célibataire",
      fiscal_nb_dependent_children: 0,
      fiscal_nb_alternate_custody_children: 0
    }
  end

  let(:simulation_toulouse) do
    {
      fiscal_revenues_p1: 25_000,
      fiscal_marital_status: "Célibataire",
      fiscal_nb_dependent_children: 2,
      fiscal_nb_alternate_custody_children: 0
    }
  end

  let(:simulation_limoges) do
    {
      fiscal_revenues_p1: 80_000,
      fiscal_revenues_p2: 120_000,
      fiscal_marital_status: "Marié / Pacsé",
      fiscal_nb_dependent_children: 3,
      fiscal_nb_alternate_custody_children: 1
    }
  end

  let(:simulation_rennes) do
    {
      fiscal_revenues_p1: 50_000,
      fiscal_marital_status: "Célibataire",
      fiscal_nb_dependent_children: 2,
      fiscal_nb_alternate_custody_children: 3
    }
  end

  let(:simulation_tours) do
    {
      fiscal_revenues_p1: 45_000,
      fiscal_revenues_p2: 37_500,
      fiscal_marital_status: "Marié / Pacsé",
      fiscal_nb_dependent_children: 0,
      fiscal_nb_alternate_custody_children: 0
    }
  end

  let(:simulation_toulon) do
    {
      fiscal_revenues_p1: 200_000,
      fiscal_revenues_p2: 125_000,
      fiscal_marital_status: "Marié / Pacsé",
      fiscal_nb_dependent_children: 3,
      fiscal_nb_alternate_custody_children: 0
    }
  end

  let(:simulation_la_ciotat) do
    {
      fiscal_revenues_p1: 120_000,
      fiscal_revenues_p2: 65_000,
      fiscal_marital_status: "Marié / Pacsé",
      fiscal_nb_dependent_children: 0,
      fiscal_nb_alternate_custody_children: 2
    }
  end

  describe "Without any property income" do
    describe "#calc_taxes_amount_per_year(simulation, calculation_method, investment_top_fiscal_year)" do
      it "returns a nice hash made of income tax params" do
        result_lyon = FrenchTaxSystem.calc_taxes_amount_per_year(simulation_lyon, "without_property_income", 10)
        result_bordeaux = FrenchTaxSystem.calc_taxes_amount_per_year(simulation_bordeaux, "without_property_income", 10)
        result_nimes = FrenchTaxSystem.calc_taxes_amount_per_year(simulation_nimes, "without_property_income", 10)
        result_lille = FrenchTaxSystem.calc_taxes_amount_per_year(simulation_lille, "without_property_income", 10)
        result_agen = FrenchTaxSystem.calc_taxes_amount_per_year(simulation_agen, "without_property_income", 10)
        result_grenoble = FrenchTaxSystem.calc_taxes_amount_per_year(simulation_grenoble, "without_property_income", 10)
        result_toulouse = FrenchTaxSystem.calc_taxes_amount_per_year(simulation_toulouse, "without_property_income", 10)
        result_limoges = FrenchTaxSystem.calc_taxes_amount_per_year(simulation_limoges, "without_property_income", 10)
        result_rennes = FrenchTaxSystem.calc_taxes_amount_per_year(simulation_rennes, "without_property_income", 10)
        result_tours = FrenchTaxSystem.calc_taxes_amount_per_year(simulation_tours, "without_property_income", 10)
        # Results should not change between fiscal years because it is only based on fiscal_revenues_p1 & 2
        expect(result_lyon[0][:income_tax][:income_tax_amount]).to be_within(0.01).of(10_300.9)
        expect(result_bordeaux[1][:income_tax][:income_tax_amount]).to be_within(0.01).of(893.53)
        expect(result_nimes[2][:income_tax][:income_tax_amount]).to be_within(0.01).of(19_310.9)
        expect(result_lille[3][:income_tax][:income_tax_amount]).to be_within(0.01).of(2_116.95)
        expect(result_agen[4][:income_tax][:income_tax_amount]).to be_within(0.01).of(11_730.9)
        expect(result_grenoble[5][:income_tax][:income_tax_amount]).to be_within(0.01).of(3_455.45)
        expect(result_toulouse[6][:income_tax][:income_tax_amount]).to be_within(0.01).of(0)
        expect(result_limoges[7][:income_tax][:income_tax_amount]).to be_within(0.01).of(37_786.56)
        expect(result_rennes[8][:income_tax][:income_tax_amount]).to be_within(0.01).of(0)
        expect(result_tours[9][:income_tax][:income_tax_amount]).to be_within(0.01).of(10_285.9)
      end

      it "returns a nice hash made of social contribution amount equal to 0" do
        result_lyon = FrenchTaxSystem.calc_taxes_amount_per_year(simulation_lyon, "without_property_income", 10)
        result_bordeaux = FrenchTaxSystem.calc_taxes_amount_per_year(simulation_bordeaux, "without_property_income", 10)
        result_nimes = FrenchTaxSystem.calc_taxes_amount_per_year(simulation_nimes, "without_property_income", 10)
        result_lille = FrenchTaxSystem.calc_taxes_amount_per_year(simulation_lille, "without_property_income", 10)
        result_agen = FrenchTaxSystem.calc_taxes_amount_per_year(simulation_agen, "without_property_income", 10)
        result_grenoble = FrenchTaxSystem.calc_taxes_amount_per_year(simulation_grenoble, "without_property_income", 10)
        result_toulouse = FrenchTaxSystem.calc_taxes_amount_per_year(simulation_toulouse, "without_property_income", 10)
        result_limoges = FrenchTaxSystem.calc_taxes_amount_per_year(simulation_limoges, "without_property_income", 10)
        result_rennes = FrenchTaxSystem.calc_taxes_amount_per_year(simulation_rennes, "without_property_income", 10)
        result_tours = FrenchTaxSystem.calc_taxes_amount_per_year(simulation_tours, "without_property_income", 10)
        # Results should not change between fiscal years because it is only based on fiscal_revenues_p1 & 2
        expect(result_lyon[0][:social_contributions_amount]).to eq(0)
        expect(result_bordeaux[1][:social_contributions_amount]).to eq(0)
        expect(result_nimes[2][:social_contributions_amount]).to eq(0)
        expect(result_lille[3][:social_contributions_amount]).to eq(0)
        expect(result_agen[4][:social_contributions_amount]).to eq(0)
        expect(result_grenoble[5][:social_contributions_amount]).to eq(0)
        expect(result_toulouse[6][:social_contributions_amount]).to eq(0)
        expect(result_limoges[7][:social_contributions_amount]).to eq(0)
        expect(result_rennes[8][:social_contributions_amount]).to eq(0)
        expect(result_tours[9][:social_contributions_amount]).to eq(0)
      end
    end

    describe "#calc_income_tax_amount_for_year(simulation, calculation_method, postponed_negative_taxable_property_income_from_previous_fiscal_year, investment_fiscal_year)" do
      it "returns a nice hash" do
        result_lyon = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_lyon, "without_property_income", 0, 1)
        result_bordeaux = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_bordeaux, "without_property_income", 0, 2)
        result_nimes = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_nimes, "without_property_income", 0, 3)
        result_lille = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_lille, "without_property_income", 0, 4)
        result_agen = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_agen, "without_property_income", 0, 5)
        result_grenoble = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_grenoble, "without_property_income", 0, 6)
        result_toulouse = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_toulouse, "without_property_income", 0, 7)
        result_limoges = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_limoges, "without_property_income", 0, 8)
        result_rennes = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_rennes, "without_property_income", 0, 9)
        result_tours = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_tours, "without_property_income", 0, 10)
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
      end

      it "returns the income tax" do
        result_lyon = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_lyon, "without_property_income", 0, 1)
        result_bordeaux = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_bordeaux, "without_property_income", 0, 2)
        result_nimes = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_nimes, "without_property_income", 0, 3)
        result_lille = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_lille, "without_property_income", 0, 4)
        result_agen = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_agen, "without_property_income", 0, 5)
        result_grenoble = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_grenoble, "without_property_income", 0, 6)
        result_toulouse = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_toulouse, "without_property_income", 0, 7)
        result_limoges = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_limoges, "without_property_income", 0, 8)
        result_rennes = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_rennes, "without_property_income", 0, 9)
        result_tours = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_tours, "without_property_income", 0, 10)
        expect(result_lyon[:income_tax_amount]).to be_within(0.01).of(10_300.9)
        expect(result_bordeaux[:income_tax_amount]).to be_within(0.01).of(893.53)
        expect(result_nimes[:income_tax_amount]).to be_within(0.01).of(19_310.9)
        expect(result_lille[:income_tax_amount]).to be_within(0.01).of(2_116.95)
        expect(result_agen[:income_tax_amount]).to be_within(0.01).of(11_730.9)
        expect(result_grenoble[:income_tax_amount]).to be_within(0.01).of(3_455.45)
        expect(result_toulouse[:income_tax_amount]).to be_within(0.01).of(0)
        expect(result_limoges[:income_tax_amount]).to be_within(0.01).of(37_786.56)
        expect(result_rennes[:income_tax_amount]).to be_within(0.01).of(0)
        expect(result_tours[:income_tax_amount]).to be_within(0.01).of(10_285.9)
      end

      it "returns the average tax rate" do
        result_lyon = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_lyon, "without_property_income", 0, 1)
        result_bordeaux = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_bordeaux, "without_property_income", 0, 2)
        result_nimes = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_nimes, "without_property_income", 0, 3)
        result_lille = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_lille, "without_property_income", 0, 4)
        result_agen = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_agen, "without_property_income", 0, 5)
        result_grenoble = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_grenoble, "without_property_income", 0, 6)
        result_toulouse = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_toulouse, "without_property_income", 0, 7)
        result_limoges = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_limoges, "without_property_income", 0, 8)
        result_rennes = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_rennes, "without_property_income", 0, 9)
        result_tours = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_tours, "without_property_income", 0, 10)
        expect(result_lyon[:average_tax_rate]).to be_within(0.001).of(0.1144)
        expect(result_bordeaux[:average_tax_rate]).to be_within(0.001).of(0.0165)
        expect(result_nimes[:average_tax_rate]).to be_within(0.001).of(0.1479)
        expect(result_lille[:average_tax_rate]).to be_within(0.001).of(0.0427)
        expect(result_agen[:average_tax_rate]).to be_within(0.001).of(0.1173)
        expect(result_grenoble[:average_tax_rate]).to be_within(0.001).of(0.1096)
        expect(result_toulouse[:average_tax_rate]).to be_within(0.001).of(0)
        expect(result_limoges[:average_tax_rate]).to be_within(0.001).of(0.2099)
        expect(result_rennes[:average_tax_rate]).to be_within(0.001).of(0)
        expect(result_tours[:average_tax_rate]).to be_within(0.001).of(0.1385)
      end

      it "returns the global net taxable amount" do
        result_lyon = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_lyon, "without_property_income", 0, 1)
        result_bordeaux = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_bordeaux, "without_property_income", 0, 2)
        result_nimes = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_nimes, "without_property_income", 0, 3)
        result_lille = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_lille, "without_property_income", 0, 4)
        result_agen = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_agen, "without_property_income", 0, 5)
        result_grenoble = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_grenoble, "without_property_income", 0, 6)
        result_toulouse = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_toulouse, "without_property_income", 0, 7)
        result_limoges = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_limoges, "without_property_income", 0, 8)
        result_rennes = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_rennes, "without_property_income", 0, 9)
        result_tours = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_tours, "without_property_income", 0, 10)
        expect(result_lyon[:global_net_taxable_income_amount]).to be_within(0.01).of(90_000)
        expect(result_bordeaux[:global_net_taxable_income_amount]).to be_within(0.01).of(54_000)
        expect(result_nimes[:global_net_taxable_income_amount]).to be_within(0.01).of(130_500)
        expect(result_lille[:global_net_taxable_income_amount]).to be_within(0.01).of(49_500)
        expect(result_agen[:global_net_taxable_income_amount]).to be_within(0.01).of(100_000)
        expect(result_grenoble[:global_net_taxable_income_amount]).to be_within(0.01).of(31_500)
        expect(result_toulouse[:global_net_taxable_income_amount]).to be_within(0.01).of(22_500)
        expect(result_limoges[:global_net_taxable_income_amount]).to be_within(0.01).of(180_000)
        expect(result_rennes[:global_net_taxable_income_amount]).to be_within(0.01).of(45_000)
        expect(result_tours[:global_net_taxable_income_amount]).to be_within(0.01).of(74_250)
      end

      it "returns the net property taxable amount" do
        result_lyon = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_lyon, "without_property_income", 0, 1)
        result_bordeaux = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_bordeaux, "without_property_income", 0, 2)
        result_nimes = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_nimes, "without_property_income", 0, 3)
        result_lille = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_lille, "without_property_income", 0, 4)
        result_agen = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_agen, "without_property_income", 0, 5)
        result_grenoble = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_grenoble, "without_property_income", 0, 6)
        result_toulouse = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_toulouse, "without_property_income", 0, 7)
        result_limoges = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_limoges, "without_property_income", 0, 8)
        result_rennes = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_rennes, "without_property_income", 0, 9)
        result_tours = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_tours, "without_property_income", 0, 10)
        expect(result_lyon[:net_taxable_property_income_amount]).to be_within(0.01).of(0)
        expect(result_bordeaux[:net_taxable_property_income_amount]).to be_within(0.01).of(0)
        expect(result_nimes[:net_taxable_property_income_amount]).to be_within(0.01).of(0)
        expect(result_lille[:net_taxable_property_income_amount]).to be_within(0.01).of(0)
        expect(result_agen[:net_taxable_property_income_amount]).to be_within(0.01).of(0)
        expect(result_grenoble[:net_taxable_property_income_amount]).to be_within(0.01).of(0)
        expect(result_toulouse[:net_taxable_property_income_amount]).to be_within(0.01).of(0)
        expect(result_limoges[:net_taxable_property_income_amount]).to be_within(0.01).of(0)
        expect(result_rennes[:net_taxable_property_income_amount]).to be_within(0.01).of(0)
        expect(result_tours[:net_taxable_property_income_amount]).to be_within(0.01).of(0)
      end

      it "returns true if there is a negative taxable property income" do
        result_lyon = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_lyon, "without_property_income", 0, 1)
        result_bordeaux = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_bordeaux, "without_property_income", 0, 2)
        result_nimes = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_nimes, "without_property_income", 0, 3)
        result_lille = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_lille, "without_property_income", 0, 4)
        result_agen = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_agen, "without_property_income", 0, 5)
        result_grenoble = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_grenoble, "without_property_income", 0, 6)
        result_toulouse = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_toulouse, "without_property_income", 0, 7)
        result_limoges = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_limoges, "without_property_income", 0, 8)
        result_rennes = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_rennes, "without_property_income", 0, 9)
        result_tours = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_tours, "without_property_income", 0, 10)
        expect(result_lyon[:negative_taxable_property_income?]).to eq(false)
        expect(result_bordeaux[:negative_taxable_property_income?]).to eq(false)
        expect(result_nimes[:negative_taxable_property_income?]).to eq(false)
        expect(result_lille[:negative_taxable_property_income?]).to eq(false)
        expect(result_agen[:negative_taxable_property_income?]).to eq(false)
        expect(result_grenoble[:negative_taxable_property_income?]).to eq(false)
        expect(result_toulouse[:negative_taxable_property_income?]).to eq(false)
        expect(result_limoges[:negative_taxable_property_income?]).to eq(false)
        expect(result_rennes[:negative_taxable_property_income?]).to eq(false)
        expect(result_tours[:negative_taxable_property_income?]).to eq(false)
      end

      it "returns the negative taxable property income amount postponed to the next fiscal year" do
        result_lyon = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_lyon, "without_property_income", 0, 1)
        result_bordeaux = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_bordeaux, "without_property_income", 0, 2)
        result_nimes = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_nimes, "without_property_income", 0, 3)
        result_lille = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_lille, "without_property_income", 0, 4)
        result_agen = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_agen, "without_property_income", 0, 5)
        result_grenoble = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_grenoble, "without_property_income", 0, 6)
        result_toulouse = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_toulouse, "without_property_income", 0, 7)
        result_limoges = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_limoges, "without_property_income", 0, 8)
        result_rennes = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_rennes, "without_property_income", 0, 9)
        result_tours = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_tours, "without_property_income", 0, 10)
        expect(result_lyon[:negative_taxable_property_income_amount_to_postpone]).to be_within(0.01).of(0)
        expect(result_bordeaux[:negative_taxable_property_income_amount_to_postpone]).to be_within(0.01).of(0)
        expect(result_nimes[:negative_taxable_property_income_amount_to_postpone]).to be_within(0.01).of(0)
        expect(result_lille[:negative_taxable_property_income_amount_to_postpone]).to be_within(0.01).of(0)
        expect(result_agen[:negative_taxable_property_income_amount_to_postpone]).to be_within(0.01).of(0)
        expect(result_grenoble[:negative_taxable_property_income_amount_to_postpone]).to be_within(0.01).of(0)
        expect(result_toulouse[:negative_taxable_property_income_amount_to_postpone]).to be_within(0.01).of(0)
        expect(result_limoges[:negative_taxable_property_income_amount_to_postpone]).to be_within(0.01).of(0)
        expect(result_rennes[:negative_taxable_property_income_amount_to_postpone]).to be_within(0.01).of(0)
        expect(result_tours[:negative_taxable_property_income_amount_to_postpone]).to be_within(0.01).of(0)
      end

      it "returns the discount amount on income tax for low income household" do
        result_lyon = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_lyon, "without_property_income", 0, 1)
        result_bordeaux = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_bordeaux, "without_property_income", 0, 2)
        result_nimes = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_nimes, "without_property_income", 0, 3)
        result_lille = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_lille, "without_property_income", 0, 4)
        result_agen = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_agen, "without_property_income", 0, 5)
        result_grenoble = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_grenoble, "without_property_income", 0, 6)
        result_toulouse = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_toulouse, "without_property_income", 0, 7)
        result_limoges = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_limoges, "without_property_income", 0, 8)
        result_rennes = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_rennes, "without_property_income", 0, 9)
        result_tours = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_tours, "without_property_income", 0, 10)
        expect(result_lyon[:discount_on_low_income_tax_amount]).to be_within(0.01).of(0)
        expect(result_bordeaux[:discount_on_low_income_tax_amount]).to be_within(0.01).of(609.07)
        expect(result_nimes[:discount_on_low_income_tax_amount]).to be_within(0.01).of(0)
        expect(result_lille[:discount_on_low_income_tax_amount]).to be_within(0.01).of(0)
        expect(result_agen[:discount_on_low_income_tax_amount]).to be_within(0.01).of(0)
        expect(result_grenoble[:discount_on_low_income_tax_amount]).to be_within(0.01).of(0)
        expect(result_toulouse[:discount_on_low_income_tax_amount]).to be_within(0.01).of(0)
        expect(result_limoges[:discount_on_low_income_tax_amount]).to be_within(0.01).of(0)
        expect(result_rennes[:discount_on_low_income_tax_amount]).to be_within(0.01).of(512.6)
        expect(result_tours[:discount_on_low_income_tax_amount]).to be_within(0.01).of(0)
      end

      it "returns household's fiscal parts number" do
        result_lyon = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_lyon, "without_property_income", 0, 1)
        result_bordeaux = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_bordeaux, "without_property_income", 0, 2)
        result_nimes = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_nimes, "without_property_income", 0, 3)
        result_lille = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_lille, "without_property_income", 0, 4)
        result_agen = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_agen, "without_property_income", 0, 5)
        result_grenoble = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_grenoble, "without_property_income", 0, 6)
        result_toulouse = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_toulouse, "without_property_income", 0, 7)
        result_limoges = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_limoges, "without_property_income", 0, 8)
        result_rennes = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_rennes, "without_property_income", 0, 9)
        result_tours = FrenchTaxSystem.calc_income_tax_amount_for_year(simulation_tours, "without_property_income", 0, 10)
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
      end
    end

    describe "#calc_global_net_taxable_amount(simulation, net_taxable_property_income)" do
      it "returns the net taxable amount" do
        result_lyon = FrenchTaxSystem.calc_global_net_taxable_amount(simulation_lyon, 0)
        result_bordeaux = FrenchTaxSystem.calc_global_net_taxable_amount(simulation_bordeaux, 0)
        result_nimes = FrenchTaxSystem.calc_global_net_taxable_amount(simulation_nimes, 0)
        result_lille = FrenchTaxSystem.calc_global_net_taxable_amount(simulation_lille, 0)
        result_agen = FrenchTaxSystem.calc_global_net_taxable_amount(simulation_agen, 0)
        result_grenoble = FrenchTaxSystem.calc_global_net_taxable_amount(simulation_grenoble, 0)
        result_toulouse = FrenchTaxSystem.calc_global_net_taxable_amount(simulation_toulouse, 0)
        result_limoges = FrenchTaxSystem.calc_global_net_taxable_amount(simulation_limoges, 0)
        result_rennes = FrenchTaxSystem.calc_global_net_taxable_amount(simulation_rennes, 0)
        result_tours = FrenchTaxSystem.calc_global_net_taxable_amount(simulation_tours, 0)
        expect(result_lyon).to be_within(0.01).of(90_000)
        expect(result_bordeaux).to be_within(0.01).of(54_000)
        expect(result_nimes).to be_within(0.01).of(130_500)
        expect(result_lille).to be_within(0.01).of(49_500)
        expect(result_agen).to be_within(0.01).of(100_000)
        expect(result_grenoble).to be_within(0.01).of(31_500)
        expect(result_toulouse).to be_within(0.01).of(22_500)
        expect(result_limoges).to be_within(0.01).of(180_000)
        expect(result_rennes).to be_within(0.01).of(45_000)
        expect(result_tours).to be_within(0.01).of(74_250)
      end
    end

    describe "#calc_family_quotient_amount(global_net_taxable_income_amount, fiscal_nb_parts)" do
      context "for real fiscal parts" do
        it "returns the family quotient amount" do
          result_lyon = FrenchTaxSystem.calc_family_quotient_amount(90_000, 3.5)
          result_bordeaux = FrenchTaxSystem.calc_family_quotient_amount(54_000, 4)
          result_nimes = FrenchTaxSystem.calc_family_quotient_amount(130_500, 4.5)
          result_lille = FrenchTaxSystem.calc_family_quotient_amount(49_500, 3)
          result_agen = FrenchTaxSystem.calc_family_quotient_amount(100_000, 4)
          result_grenoble = FrenchTaxSystem.calc_family_quotient_amount(31_500, 1)
          result_toulouse = FrenchTaxSystem.calc_family_quotient_amount(22_500, 2.5)
          result_limoges = FrenchTaxSystem.calc_family_quotient_amount(180_000, 4.5)
          result_rennes = FrenchTaxSystem.calc_family_quotient_amount(45_000, 4)
          result_tours = FrenchTaxSystem.calc_family_quotient_amount(74_250, 2)
          expect(result_lyon).to be_within(0.01).of(25_714.28)
          expect(result_bordeaux).to be_within(0.01).of(13_500)
          expect(result_nimes).to be_within(0.01).of(29_000)
          expect(result_lille).to be_within(0.01).of(16_500)
          expect(result_agen).to be_within(0.01).of(25_000)
          expect(result_grenoble).to be_within(0.01).of(31_500)
          expect(result_toulouse).to be_within(0.01).of(9_000)
          expect(result_limoges).to be_within(0.01).of(40_000)
          expect(result_rennes).to be_within(0.01).of(11_250)
          expect(result_tours).to be_within(0.01).of(37_125)
        end
      end

      context "for fiscal parts capping" do
        it "returns the family quotient amount" do
          result_lyon = FrenchTaxSystem.calc_family_quotient_amount(90_000, 2)
          result_bordeaux = FrenchTaxSystem.calc_family_quotient_amount(54_000, 2)
          result_nimes = FrenchTaxSystem.calc_family_quotient_amount(130_500, 2)
          result_lille = FrenchTaxSystem.calc_family_quotient_amount(49_500, 1)
          result_agen = FrenchTaxSystem.calc_family_quotient_amount(100_000, 2)
          result_grenoble = FrenchTaxSystem.calc_family_quotient_amount(31_500, 1)
          result_toulouse = FrenchTaxSystem.calc_family_quotient_amount(22_500, 1)
          result_limoges = FrenchTaxSystem.calc_family_quotient_amount(180_000, 2)
          result_rennes = FrenchTaxSystem.calc_family_quotient_amount(45_000, 1)
          result_tours = FrenchTaxSystem.calc_family_quotient_amount(74_250, 2)
          expect(result_lyon).to be_within(0.01).of(45_000)
          expect(result_bordeaux).to be_within(0.01).of(27_000)
          expect(result_nimes).to be_within(0.01).of(65_250)
          expect(result_lille).to be_within(0.01).of(49_500)
          expect(result_agen).to be_within(0.01).of(50_000)
          expect(result_grenoble).to be_within(0.01).of(31_500)
          expect(result_toulouse).to be_within(0.01).of(22_500)
          expect(result_limoges).to be_within(0.01).of(90_000)
          expect(result_rennes).to be_within(0.01).of(45_000)
          expect(result_tours).to be_within(0.01).of(37_125)
        end
      end
    end

    describe "#calc_aggregated_tax_amount(family_quotient_amount, current_year)" do
      context "for real fiscal parts" do
        it "returns the aggregated tax amount" do
          current_year = Date.today.year
          result_lyon = FrenchTaxSystem.calc_aggregated_tax_amount(25_714.28, current_year)
          result_bordeaux = FrenchTaxSystem.calc_aggregated_tax_amount(13_500, current_year)
          result_nimes = FrenchTaxSystem.calc_aggregated_tax_amount(29_000, current_year)
          result_lille = FrenchTaxSystem.calc_aggregated_tax_amount(16_500, current_year)
          result_agen = FrenchTaxSystem.calc_aggregated_tax_amount(25_000, current_year)
          result_grenoble = FrenchTaxSystem.calc_aggregated_tax_amount(31_500, current_year)
          result_toulouse = FrenchTaxSystem.calc_aggregated_tax_amount(9_000, current_year)
          result_limoges = FrenchTaxSystem.calc_aggregated_tax_amount(40_000, current_year)
          result_rennes = FrenchTaxSystem.calc_aggregated_tax_amount(11_250, current_year)
          result_tours = FrenchTaxSystem.calc_aggregated_tax_amount(37_125, current_year)
          expect(result_lyon).to be_within(0.01).of(1_719.73)
          expect(result_bordeaux).to be_within(0.01).of(375.65)
          expect(result_nimes).to be_within(0.01).of(2_705.45)
          expect(result_lille).to be_within(0.01).of(705.65)
          expect(result_agen).to be_within(0.01).of(1_640.65)
          expect(result_grenoble).to be_within(0.01).of(3_455.45)
          expect(result_toulouse).to be_within(0.01).of(0)
          expect(result_limoges).to be_within(0.01).of(6_005.45)
          expect(result_rennes).to be_within(0.01).of(128.15)
          expect(result_tours).to be_within(0.01).of(5_142.95)
        end
      end

      context "for fiscal parts capping" do
        it "returns the aggregated tax amount" do
          current_year = Date.today.year
          result_lyon = FrenchTaxSystem.calc_aggregated_tax_amount(45_000, current_year)
          result_bordeaux = FrenchTaxSystem.calc_aggregated_tax_amount(27_000, current_year)
          result_nimes = FrenchTaxSystem.calc_aggregated_tax_amount(65_250, current_year)
          result_lille = FrenchTaxSystem.calc_aggregated_tax_amount(49_500, current_year)
          result_agen = FrenchTaxSystem.calc_aggregated_tax_amount(50_000, current_year)
          result_grenoble = FrenchTaxSystem.calc_aggregated_tax_amount(31_500, current_year)
          result_toulouse = FrenchTaxSystem.calc_aggregated_tax_amount(22_500, current_year)
          result_limoges = FrenchTaxSystem.calc_aggregated_tax_amount(90_000, current_year)
          result_rennes = FrenchTaxSystem.calc_aggregated_tax_amount(45_000, current_year)
          result_tours = FrenchTaxSystem.calc_aggregated_tax_amount(37_125, current_year)
          expect(result_lyon).to be_within(0.01).of(7_505.45)
          expect(result_bordeaux).to be_within(0.01).of(2_105.45)
          expect(result_nimes).to be_within(0.01).of(13_580.45)
          expect(result_lille).to be_within(0.01).of(8_855.45)
          expect(result_agen).to be_within(0.01).of(9_005.45)
          expect(result_grenoble).to be_within(0.01).of(3_455.45)
          expect(result_toulouse).to be_within(0.01).of(1_365.65)
          expect(result_limoges).to be_within(0.01).of(22_818.28)
          expect(result_rennes).to be_within(0.01).of(7_505.45)
          expect(result_tours).to be_within(0.01).of(5_142.95)
        end
      end
    end

    describe "#apply_fiscal_parts_capping(aggregated_tax_amount_for_real_fiscal_parts, fiscal_nb_parts, aggregated_tax_amount_for_fiscal_parts_capping, fiscal_nb_parts_for_capping, capping_due_to_fiscal_parts)" do
      it "returns previsional income tax with fiscal part capping effect" do
        result_lyon = FrenchTaxSystem.apply_fiscal_parts_capping(1_719.73, 3.5, 7_505.45, 2, 4_710)
        result_bordeaux = FrenchTaxSystem.apply_fiscal_parts_capping(375.65, 4, 2_105.65, 2, 6_280)
        result_nimes = FrenchTaxSystem.apply_fiscal_parts_capping(2_672.12, 4.5, 13_580.45, 2, 7_850)
        result_lille = FrenchTaxSystem.apply_fiscal_parts_capping(705.65, 3, 8_855.45, 1, 6_844)
        result_agen = FrenchTaxSystem.apply_fiscal_parts_capping(1_640.65, 4, 9_005.45, 2, 6_280)
        result_grenoble = FrenchTaxSystem.apply_fiscal_parts_capping(3_455.45, 1, 3_455.45, 1, 0)
        result_toulouse = FrenchTaxSystem.apply_fiscal_parts_capping(0, 2.5, 1_365.65, 1, 5_274)
        result_limoges = FrenchTaxSystem.apply_fiscal_parts_capping(6_005.45, 4.5, 22_818.28, 2, 7_850)
        result_rennes = FrenchTaxSystem.apply_fiscal_parts_capping(128.15, 4, 7_505.45, 1, 9_984)
        result_tours = FrenchTaxSystem.apply_fiscal_parts_capping(5_142.95, 2, 5_142.95, 2, 0)
        expect(result_lyon).to be_within(0.01).of(10_300.9)
        expect(result_bordeaux).to be_within(0.01).of(1_502.6)
        expect(result_nimes).to be_within(0.01).of(19_310.9)
        expect(result_lille).to be_within(0.01).of(2_116.95)
        expect(result_agen).to be_within(0.01).of(11_730.9)
        expect(result_grenoble).to be_within(0.01).of(3_455.45)
        expect(result_toulouse).to be_within(0.01).of(0)
        expect(result_limoges).to be_within(0.01).of(37_786.56)
        expect(result_rennes).to be_within(0.01).of(512.6)
        expect(result_tours).to be_within(0.01).of(10_285.9)
      end
    end

    describe "#apply_discount_on_low_income_tax(simulation, almost_final_income_tax, current_year)" do
      it "returns final tax income with the reduced income tax for low incomes" do
        current_year = Date.today.year

        result_lyon = FrenchTaxSystem.apply_discount_on_low_income_tax(simulation_lyon, 10_300.9, current_year)
        result_bordeaux = FrenchTaxSystem.apply_discount_on_low_income_tax(simulation_bordeaux, 1_502.6, current_year)
        result_nimes = FrenchTaxSystem.apply_discount_on_low_income_tax(simulation_nimes, 19_310.9, current_year)
        result_lille = FrenchTaxSystem.apply_discount_on_low_income_tax(simulation_lille, 2_116.95, current_year)
        result_agen = FrenchTaxSystem.apply_discount_on_low_income_tax(simulation_agen, 11_730.9, current_year)
        result_grenoble = FrenchTaxSystem.apply_discount_on_low_income_tax(simulation_grenoble, 3_455.45, current_year)
        result_toulouse = FrenchTaxSystem.apply_discount_on_low_income_tax(simulation_toulouse, 0, current_year)
        result_limoges = FrenchTaxSystem.apply_discount_on_low_income_tax(simulation_limoges, 37_786.56, current_year)
        result_rennes = FrenchTaxSystem.apply_discount_on_low_income_tax(simulation_rennes, 512.6, current_year)
        result_tours = FrenchTaxSystem.apply_discount_on_low_income_tax(simulation_tours, 10_285.9, current_year)
        expect(result_lyon).to be_within(0.01).of(10_300.9)
        expect(result_bordeaux).to be_within(0.01).of(893.53) # Married couple household effect
        expect(result_nimes).to be_within(0.01).of(19_310.9)
        expect(result_lille).to be_within(0.01).of(2_116.95)
        expect(result_agen).to be_within(0.01).of(11_730.9)
        expect(result_grenoble).to be_within(0.01).of(3_455.45)
        expect(result_toulouse).to be_within(0.01).of(0)
        expect(result_limoges).to be_within(0.01).of(37_786.56)
        expect(result_rennes).to be_within(0.01).of(0) # Single person household effect
        expect(result_tours).to be_within(0.01).of(10_285.9)
      end
    end
  end

  describe "Not related to property income" do
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

    let(:simulation_fiscal_parts_six) do
      {
        fiscal_marital_status: "Marié / Pacsé",
        fiscal_nb_dependent_children: 2,
        fiscal_nb_alternate_custody_children: 1
      }
    end

    let(:simulation_fiscal_parts_seven) do
      {
        fiscal_marital_status: "Marié / Pacsé",
        fiscal_nb_dependent_children: 1,
        fiscal_nb_alternate_custody_children: 0
      }
    end

    let(:simulation_fiscal_parts_eight) do
      {
        fiscal_marital_status: "Marié / Pacsé",
        fiscal_nb_dependent_children: 0,
        fiscal_nb_alternate_custody_children: 1
      }
    end

    let(:simulation_fiscal_parts_nine) do
      {
        fiscal_marital_status: "Marié / Pacsé",
        fiscal_nb_dependent_children: 6,
        fiscal_nb_alternate_custody_children: 4
      }
    end

    let(:simulation_fiscal_parts_ten) do
      {
        fiscal_marital_status: "Marié / Pacsé",
        fiscal_nb_dependent_children: 1,
        fiscal_nb_alternate_custody_children: 1
      }
    end

    let(:simulation_fiscal_parts_eleven) do
      {
        fiscal_marital_status: "Marié / Pacsé",
        fiscal_nb_dependent_children: 1,
        fiscal_nb_alternate_custody_children: 2
      }
    end

    let(:simulation_fiscal_parts_twelve) do
      {
        fiscal_marital_status: "Marié / Pacsé",
        fiscal_nb_dependent_children: 1,
        fiscal_nb_alternate_custody_children: 4
      }
    end

    describe "#calc_fiscal_nb_parts(simulation)" do
      it "returns household's fiscal parts number" do
        result_lyon = FrenchTaxSystem.calc_fiscal_nb_parts(simulation_lyon)
        result_bordeaux = FrenchTaxSystem.calc_fiscal_nb_parts(simulation_bordeaux)
        result_nimes = FrenchTaxSystem.calc_fiscal_nb_parts(simulation_nimes)
        result_lille = FrenchTaxSystem.calc_fiscal_nb_parts(simulation_lille)
        result_agen = FrenchTaxSystem.calc_fiscal_nb_parts(simulation_agen)
        result_grenoble = FrenchTaxSystem.calc_fiscal_nb_parts(simulation_grenoble)
        result_toulouse = FrenchTaxSystem.calc_fiscal_nb_parts(simulation_toulouse)
        result_limoges = FrenchTaxSystem.calc_fiscal_nb_parts(simulation_limoges)
        result_rennes = FrenchTaxSystem.calc_fiscal_nb_parts(simulation_rennes)
        result_tours = FrenchTaxSystem.calc_fiscal_nb_parts(simulation_tours)
        expect(result_lyon).to eq(3.5)
        expect(result_bordeaux).to eq(4)
        expect(result_nimes).to eq(4.5)
        expect(result_lille).to eq(3)
        expect(result_agen).to eq(4)
        expect(result_grenoble).to eq(1)
        expect(result_toulouse).to eq(2.5)
        expect(result_limoges).to eq(4.5)
        expect(result_rennes).to eq(4)
        expect(result_tours).to eq(2)

        result_simulation_one = FrenchTaxSystem.calc_fiscal_nb_parts(simulation_fiscal_parts_one)
        result_simulation_two = FrenchTaxSystem.calc_fiscal_nb_parts(simulation_fiscal_parts_two)
        result_simulation_three = FrenchTaxSystem.calc_fiscal_nb_parts(simulation_fiscal_parts_three)
        result_simulation_four = FrenchTaxSystem.calc_fiscal_nb_parts(simulation_fiscal_parts_four)
        result_simulation_five = FrenchTaxSystem.calc_fiscal_nb_parts(simulation_fiscal_parts_five)
        result_simulation_six = FrenchTaxSystem.calc_fiscal_nb_parts(simulation_fiscal_parts_six)
        result_simulation_seven = FrenchTaxSystem.calc_fiscal_nb_parts(simulation_fiscal_parts_seven)
        result_simulation_eight = FrenchTaxSystem.calc_fiscal_nb_parts(simulation_fiscal_parts_eight)
        result_simulation_nine = FrenchTaxSystem.calc_fiscal_nb_parts(simulation_fiscal_parts_nine)
        result_simulation_ten = FrenchTaxSystem.calc_fiscal_nb_parts(simulation_fiscal_parts_ten)
        result_simulation_eleven = FrenchTaxSystem.calc_fiscal_nb_parts(simulation_fiscal_parts_eleven)
        result_simulation_twelve = FrenchTaxSystem.calc_fiscal_nb_parts(simulation_fiscal_parts_twelve)
        expect(result_simulation_one).to eq(3)
        expect(result_simulation_two).to eq(2)
        expect(result_simulation_three).to eq(1.5)
        expect(result_simulation_four).to eq(8.5)
        expect(result_simulation_five).to eq(2.25)
        expect(result_simulation_six).to eq(3.5)
        expect(result_simulation_seven).to eq(2.5)
        expect(result_simulation_eight).to eq(2.25)
        expect(result_simulation_nine).to eq(9)
        expect(result_simulation_ten).to eq(2.75)
        expect(result_simulation_eleven).to eq(3.25)
        expect(result_simulation_twelve).to eq(4.25)
      end
    end

    describe "#calc_fiscal_nb_parts_incurred_from_children(simulation)" do
      it "returns household's fiscal parts number incurred from dependant and alternate custody children" do
        result_lyon = FrenchTaxSystem.calc_fiscal_nb_parts_incurred_from_children(simulation_lyon)
        result_bordeaux = FrenchTaxSystem.calc_fiscal_nb_parts_incurred_from_children(simulation_bordeaux)
        result_nimes = FrenchTaxSystem.calc_fiscal_nb_parts_incurred_from_children(simulation_nimes)
        result_lille = FrenchTaxSystem.calc_fiscal_nb_parts_incurred_from_children(simulation_lille)
        result_agen = FrenchTaxSystem.calc_fiscal_nb_parts_incurred_from_children(simulation_agen)
        result_grenoble = FrenchTaxSystem.calc_fiscal_nb_parts_incurred_from_children(simulation_grenoble)
        result_toulouse = FrenchTaxSystem.calc_fiscal_nb_parts_incurred_from_children(simulation_toulouse)
        result_limoges = FrenchTaxSystem.calc_fiscal_nb_parts_incurred_from_children(simulation_limoges)
        result_rennes = FrenchTaxSystem.calc_fiscal_nb_parts_incurred_from_children(simulation_rennes)
        result_tours = FrenchTaxSystem.calc_fiscal_nb_parts_incurred_from_children(simulation_tours)
        expect(result_lyon).to eq(1.5)
        expect(result_bordeaux).to eq(2)
        expect(result_nimes).to eq(2.5)
        expect(result_lille).to eq(1.5)
        expect(result_agen).to eq(2)
        expect(result_grenoble).to eq(0)
        expect(result_toulouse).to eq(1)
        expect(result_limoges).to eq(2.5)
        expect(result_rennes).to eq(2.5)
        expect(result_tours).to eq(0)

        result_simulation_one = FrenchTaxSystem.calc_fiscal_nb_parts_incurred_from_children(simulation_fiscal_parts_one)
        result_simulation_two = FrenchTaxSystem.calc_fiscal_nb_parts_incurred_from_children(simulation_fiscal_parts_two)
        result_simulation_three = FrenchTaxSystem.calc_fiscal_nb_parts_incurred_from_children(simulation_fiscal_parts_three)
        result_simulation_four = FrenchTaxSystem.calc_fiscal_nb_parts_incurred_from_children(simulation_fiscal_parts_four)
        result_simulation_five = FrenchTaxSystem.calc_fiscal_nb_parts_incurred_from_children(simulation_fiscal_parts_five)
        result_simulation_six = FrenchTaxSystem.calc_fiscal_nb_parts_incurred_from_children(simulation_fiscal_parts_six)
        result_simulation_seven = FrenchTaxSystem.calc_fiscal_nb_parts_incurred_from_children(simulation_fiscal_parts_seven)
        result_simulation_eight = FrenchTaxSystem.calc_fiscal_nb_parts_incurred_from_children(simulation_fiscal_parts_eight)
        result_simulation_nine = FrenchTaxSystem.calc_fiscal_nb_parts_incurred_from_children(simulation_fiscal_parts_nine)
        result_simulation_ten = FrenchTaxSystem.calc_fiscal_nb_parts_incurred_from_children(simulation_fiscal_parts_ten)
        result_simulation_eleven = FrenchTaxSystem.calc_fiscal_nb_parts_incurred_from_children(simulation_fiscal_parts_eleven)
        result_simulation_twelve = FrenchTaxSystem.calc_fiscal_nb_parts_incurred_from_children(simulation_fiscal_parts_twelve)
        expect(result_simulation_one).to eq(1.5)
        expect(result_simulation_two).to eq(0.5)
        expect(result_simulation_three).to eq(0.25)
        expect(result_simulation_four).to eq(7)
        expect(result_simulation_five).to eq(0.75)
        expect(result_simulation_six).to eq(1.5)
        expect(result_simulation_seven).to eq(0.5)
        expect(result_simulation_eight).to eq(0.25)
        expect(result_simulation_nine).to eq(7)
        expect(result_simulation_ten).to eq(0.75)
        expect(result_simulation_eleven).to eq(1.25)
        expect(result_simulation_twelve).to eq(2.25)
      end
    end

    describe "#calc_capping_due_to_fiscal_parts(simulation, fiscal_nb_parts, current_year)" do
      it "returns the maximal income tax reduction incurred from fiscal nb of parts generated by children" do
        current_year = Date.today.year

        fiscal_nb_parts_lyon = FrenchTaxSystem.calc_fiscal_nb_parts(simulation_lyon)
        fiscal_nb_parts_bordeaux = FrenchTaxSystem.calc_fiscal_nb_parts(simulation_bordeaux)
        fiscal_nb_parts_nimes = FrenchTaxSystem.calc_fiscal_nb_parts(simulation_nimes)
        fiscal_nb_parts_lille = FrenchTaxSystem.calc_fiscal_nb_parts(simulation_lille)
        fiscal_nb_parts_agen = FrenchTaxSystem.calc_fiscal_nb_parts(simulation_agen)
        fiscal_nb_parts_grenoble = FrenchTaxSystem.calc_fiscal_nb_parts(simulation_grenoble)
        fiscal_nb_parts_toulouse = FrenchTaxSystem.calc_fiscal_nb_parts(simulation_toulouse)
        fiscal_nb_parts_limoges = FrenchTaxSystem.calc_fiscal_nb_parts(simulation_limoges)
        fiscal_nb_parts_rennes = FrenchTaxSystem.calc_fiscal_nb_parts(simulation_rennes)
        fiscal_nb_parts_tours = FrenchTaxSystem.calc_fiscal_nb_parts(simulation_tours)
        result_lyon = FrenchTaxSystem.calc_capping_due_to_fiscal_parts(simulation_lyon, fiscal_nb_parts_lyon, current_year)
        result_bordeaux = FrenchTaxSystem.calc_capping_due_to_fiscal_parts(simulation_bordeaux, fiscal_nb_parts_bordeaux, current_year)
        result_nimes = FrenchTaxSystem.calc_capping_due_to_fiscal_parts(simulation_nimes, fiscal_nb_parts_nimes, current_year)
        result_lille = FrenchTaxSystem.calc_capping_due_to_fiscal_parts(simulation_lille, fiscal_nb_parts_lille, current_year)
        result_agen = FrenchTaxSystem.calc_capping_due_to_fiscal_parts(simulation_agen, fiscal_nb_parts_agen, current_year)
        result_grenoble = FrenchTaxSystem.calc_capping_due_to_fiscal_parts(simulation_grenoble, fiscal_nb_parts_grenoble, current_year)
        result_toulouse = FrenchTaxSystem.calc_capping_due_to_fiscal_parts(simulation_toulouse, fiscal_nb_parts_toulouse, current_year)
        result_limoges = FrenchTaxSystem.calc_capping_due_to_fiscal_parts(simulation_limoges, fiscal_nb_parts_limoges, current_year)
        result_rennes = FrenchTaxSystem.calc_capping_due_to_fiscal_parts(simulation_rennes, fiscal_nb_parts_rennes, current_year)
        result_tours = FrenchTaxSystem.calc_capping_due_to_fiscal_parts(simulation_tours, fiscal_nb_parts_tours, current_year)
        expect(result_lyon).to eq(4_710)
        expect(result_bordeaux).to eq(6_280)
        expect(result_nimes).to eq(7_850)
        expect(result_lille).to eq(6_844)
        expect(result_agen).to eq(6_280)
        expect(result_grenoble).to eq(0)
        expect(result_toulouse).to eq(5_274)
        expect(result_limoges).to eq(7_850)
        expect(result_rennes).to eq(9_984)
        expect(result_tours).to eq(0)

        fiscal_nb_parts_one = FrenchTaxSystem.calc_fiscal_nb_parts(simulation_fiscal_parts_one)
        fiscal_nb_parts_two = FrenchTaxSystem.calc_fiscal_nb_parts(simulation_fiscal_parts_two)
        fiscal_nb_parts_three = FrenchTaxSystem.calc_fiscal_nb_parts(simulation_fiscal_parts_three)
        fiscal_nb_parts_four = FrenchTaxSystem.calc_fiscal_nb_parts(simulation_fiscal_parts_four)
        fiscal_nb_parts_five = FrenchTaxSystem.calc_fiscal_nb_parts(simulation_fiscal_parts_five)
        fiscal_nb_parts_six = FrenchTaxSystem.calc_fiscal_nb_parts(simulation_fiscal_parts_six)
        fiscal_nb_parts_seven = FrenchTaxSystem.calc_fiscal_nb_parts(simulation_fiscal_parts_seven)
        fiscal_nb_parts_eight = FrenchTaxSystem.calc_fiscal_nb_parts(simulation_fiscal_parts_eight)
        fiscal_nb_parts_nine = FrenchTaxSystem.calc_fiscal_nb_parts(simulation_fiscal_parts_nine)
        fiscal_nb_parts_ten = FrenchTaxSystem.calc_fiscal_nb_parts(simulation_fiscal_parts_ten)
        result_simulation_one = FrenchTaxSystem.calc_capping_due_to_fiscal_parts(simulation_fiscal_parts_one,
                                                                                 fiscal_nb_parts_one, current_year)
        result_simulation_two = FrenchTaxSystem.calc_capping_due_to_fiscal_parts(simulation_fiscal_parts_two,
                                                                                 fiscal_nb_parts_two, current_year)
        result_simulation_three = FrenchTaxSystem.calc_capping_due_to_fiscal_parts(simulation_fiscal_parts_three,
                                                                                   fiscal_nb_parts_three, current_year)
        result_simulation_four = FrenchTaxSystem.calc_capping_due_to_fiscal_parts(simulation_fiscal_parts_four,
                                                                                  fiscal_nb_parts_four, current_year)
        result_simulation_five = FrenchTaxSystem.calc_capping_due_to_fiscal_parts(simulation_fiscal_parts_five,
                                                                                  fiscal_nb_parts_five, current_year)
        result_simulation_six = FrenchTaxSystem.calc_capping_due_to_fiscal_parts(simulation_fiscal_parts_six,
                                                                                 fiscal_nb_parts_six, current_year)
        result_simulation_seven = FrenchTaxSystem.calc_capping_due_to_fiscal_parts(simulation_fiscal_parts_seven,
                                                                                   fiscal_nb_parts_seven, current_year)
        result_simulation_eight = FrenchTaxSystem.calc_capping_due_to_fiscal_parts(simulation_fiscal_parts_eight,
                                                                                   fiscal_nb_parts_eight, current_year)
        result_simulation_nine = FrenchTaxSystem.calc_capping_due_to_fiscal_parts(simulation_fiscal_parts_nine,
                                                                                  fiscal_nb_parts_nine, current_year)
        result_simulation_ten = FrenchTaxSystem.calc_capping_due_to_fiscal_parts(simulation_fiscal_parts_ten,
                                                                                 fiscal_nb_parts_ten, current_year)
        expect(result_simulation_one).to eq(6_844)
        expect(result_simulation_two).to eq(3_704)
        expect(result_simulation_three).to eq(1_852)
        expect(result_simulation_four).to eq(24_114)
        expect(result_simulation_five).to eq(4_489)
        expect(result_simulation_six).to eq(4_710)
        expect(result_simulation_seven).to eq(1_570)
        expect(result_simulation_eight).to eq(785)
        expect(result_simulation_nine).to eq(21_980)
        expect(result_simulation_ten).to eq(2_355)
      end
    end
  end
end
