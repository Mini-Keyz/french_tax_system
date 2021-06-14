# frozen_string_literal: true

RSpec.describe FrenchTaxSystem::NueFormulas do
  let(:simulation_lyon) do
    {
      house_rent_amount_per_year: 23_200,
      house_first_works_amount: 40_000,
      house_landlord_charges_amount_per_year: 3_600,
      house_property_management_amount_per_year: 1_856,
      house_insurance_gli_amount_per_year: 812,
      house_insurance_pno_amount_per_year: 100,
      house_property_tax_amount_per_year: 2_000,
      credit_loan_cumulative_interests_paid_for_year_two: 5_499.91,
      credit_loan_insurance_amount_per_year: 1740,
      fiscal_regimen: "Réel"
    }
  end

  let(:simulation_bordeaux) do
    {
      house_rent_amount_per_year: 8_076,
      house_first_works_amount: 5_000,
      house_landlord_charges_amount_per_year: 0,
      house_property_management_amount_per_year: 600,
      house_insurance_gli_amount_per_year: 282.66,
      house_insurance_pno_amount_per_year: 100,
      house_property_tax_amount_per_year: 1_200,
      credit_loan_cumulative_interests_paid_for_year_two: 1_227.42,
      credit_loan_insurance_amount_per_year: 405,
      fiscal_regimen: "Réel"
    }
  end

  let(:simulation_nimes) do
    {
      house_rent_amount_per_year: 74_800,
      house_first_works_amount: 125_000,
      house_landlord_charges_amount_per_year: 6_000,
      house_property_management_amount_per_year: 5_984,
      house_insurance_gli_amount_per_year: 2_618,
      house_insurance_pno_amount_per_year: 100,
      house_property_tax_amount_per_year: 5_500,
      credit_loan_cumulative_interests_paid_for_year_two: 8_869.46,
      credit_loan_insurance_amount_per_year: 2_850,
      fiscal_regimen: "Réel"
    }
  end

  let(:simulation_lille) do
    {
      house_rent_amount_per_year: 7_270,
      house_first_works_amount: 2_500,
      house_landlord_charges_amount_per_year: 540,
      house_property_management_amount_per_year: 0,
      house_insurance_gli_amount_per_year: 254.45,
      house_insurance_pno_amount_per_year: 100,
      house_property_tax_amount_per_year: 300,
      credit_loan_cumulative_interests_paid_for_year_two: 645.21,
      credit_loan_insurance_amount_per_year: 225,
      fiscal_regimen: "Réel"
    }
  end

  let(:simulation_agen) do
    {
      house_rent_amount_per_year: 28_944,
      house_first_works_amount: 0,
      house_landlord_charges_amount_per_year: 2_000,
      house_property_management_amount_per_year: 0,
      house_insurance_gli_amount_per_year: 1_013.04,
      house_insurance_pno_amount_per_year: 100,
      house_property_tax_amount_per_year: 3_500,
      credit_loan_cumulative_interests_paid_for_year_two: 2_800.88,
      credit_loan_insurance_amount_per_year: 900,
      fiscal_regimen: "Réel"
    }
  end

  let(:simulation_grenoble) do
    {
      house_rent_amount_per_year: 13_760,
      house_first_works_amount: 10_000,
      house_landlord_charges_amount_per_year: 1_440,
      house_property_management_amount_per_year: 1_100.80,
      house_insurance_gli_amount_per_year: 481.60,
      house_insurance_pno_amount_per_year: 100,
      house_property_tax_amount_per_year: 250,
      credit_loan_cumulative_interests_paid_for_year_two: 0,
      credit_loan_insurance_amount_per_year: 0,
      fiscal_regimen: "Réel"
    }
  end

  let(:simulation_toulouse) do
    {
      house_rent_amount_per_year: 5_508,
      house_first_works_amount: 0,
      house_landlord_charges_amount_per_year: 410,
      house_property_management_amount_per_year: 0,
      house_insurance_gli_amount_per_year: 192.78,
      house_insurance_pno_amount_per_year: 100,
      house_property_tax_amount_per_year: 200,
      credit_loan_cumulative_interests_paid_for_year_two: 858.94,
      credit_loan_insurance_amount_per_year: 276,
      fiscal_regimen: "Réel"
    }
  end

  let(:simulation_limoges) do
    {
      house_rent_amount_per_year: 32_160,
      house_first_works_amount: 25_000,
      house_landlord_charges_amount_per_year: 3_000,
      house_property_management_amount_per_year: 2_572.8,
      house_insurance_gli_amount_per_year: 1_125.6,
      house_insurance_pno_amount_per_year: 100,
      house_property_tax_amount_per_year: 4_000,
      credit_loan_cumulative_interests_paid_for_year_two: 2_520.80,
      credit_loan_insurance_amount_per_year: 810,
      fiscal_regimen: "Réel"
    }
  end

  let(:simulation_rennes) do
    {
      house_rent_amount_per_year: 26_060,
      house_first_works_amount: 50_000,
      house_landlord_charges_amount_per_year: 2_500,
      house_property_management_amount_per_year: 0,
      house_insurance_gli_amount_per_year: 912.1,
      house_insurance_pno_amount_per_year: 100,
      house_property_tax_amount_per_year: 1_950,
      credit_loan_cumulative_interests_paid_for_year_two: 2_334.07,
      credit_loan_insurance_amount_per_year: 750,
      fiscal_regimen: "Réel"
    }
  end

  let(:simulation_tours) do
    {
      house_rent_amount_per_year: 24_544,
      house_first_works_amount: 25_000,
      house_landlord_charges_amount_per_year: 1_200,
      house_property_management_amount_per_year: 1_963.52,
      house_insurance_gli_amount_per_year: 859.04,
      house_insurance_pno_amount_per_year: 100,
      house_property_tax_amount_per_year: 1_250,
      credit_loan_cumulative_interests_paid_for_year_two: 2_800.88,
      credit_loan_insurance_amount_per_year: 900,
      fiscal_regimen: "Réel"
    }
  end

  describe "For 'Forfait' fiscal regimen" do
    let(:simulation_toulon) do
      {
        house_rent_amount_per_year: 12_000,
        fiscal_regimen: "Forfait"
      }
    end

    let(:simulation_la_ciotat) do
      {
        house_rent_amount_per_year: 2_400,
        fiscal_regimen: "Forfait"
      }
    end

    describe "#calc_net_taxable_property_income_amount(simulation, postponed_negative_taxable_property_income_from_previous_fiscal_year, investment_fiscal_year)" do
      it "returns a nice hash" do
        result_toulon_first_year = FrenchTaxSystem::NueFormulas.calc_net_taxable_property_income_amount(simulation_toulon, 0, 1)
        result_toulon_second_year = FrenchTaxSystem::NueFormulas.calc_net_taxable_property_income_amount(simulation_toulon, 0, 2)
        result_toulon_tenth_year = FrenchTaxSystem::NueFormulas.calc_net_taxable_property_income_amount(simulation_toulon, 0, 10)
        result_la_ciotat_fifteenth_year = FrenchTaxSystem::NueFormulas.calc_net_taxable_property_income_amount(simulation_la_ciotat, 0, 15)
        expect(result_toulon_first_year).to be_a(Hash)
        expect(result_toulon_second_year).to be_a(Hash)
        expect(result_toulon_tenth_year).to be_a(Hash)
        expect(result_la_ciotat_fifteenth_year).to be_a(Hash)
      end

      it "returns the net taxable property income amount incurred from the potentiel investment for any year" do
        result_toulon_first_year = FrenchTaxSystem::NueFormulas.calc_net_taxable_property_income_amount(simulation_toulon, 0, 1)
        result_toulon_second_year = FrenchTaxSystem::NueFormulas.calc_net_taxable_property_income_amount(simulation_toulon, 0, 2)
        result_toulon_tenth_year = FrenchTaxSystem::NueFormulas.calc_net_taxable_property_income_amount(simulation_toulon, 0, 10)
        result_la_ciotat_fifteenth_year = FrenchTaxSystem::NueFormulas.calc_net_taxable_property_income_amount(simulation_la_ciotat, 0, 15)
        expect(result_toulon_first_year[:net_taxable_property_income_amount]).to be_within(0.01).of(8_400)
        expect(result_toulon_second_year[:net_taxable_property_income_amount]).to be_within(0.01).of(8_400)
        expect(result_toulon_tenth_year[:net_taxable_property_income_amount]).to be_within(0.01).of(8_400)
        expect(result_la_ciotat_fifteenth_year[:net_taxable_property_income_amount]).to be_within(0.01).of(1_680)
      end
    end

    describe "#calc_flat_rate_regimen_net_taxable_property_income_amount(simulation)" do
      it "returns the net taxable property income amount" do
        result_toulon = FrenchTaxSystem::NueFormulas.calc_flat_rate_regimen_net_taxable_property_income_amount(simulation_toulon)
        expect(result_toulon[:net_taxable_property_income_amount]).to be_within(0.01).of(8_400)

        result_la_ciotat = FrenchTaxSystem::NueFormulas.calc_flat_rate_regimen_net_taxable_property_income_amount(simulation_la_ciotat)
        expect(result_la_ciotat[:net_taxable_property_income_amount]).to be_within(0.01).of(1_680)
      end
    end
  end

  describe "For 'Reel' fiscal regimen" do
    # describe "#calc_net_taxable_property_income_amount(simulation, postponed_negative_taxable_property_income_from_previous_fiscal_year, investment_fiscal_year)" do
    #   it "returns the net taxable property income amount incurred from the potential investment" do
    #     result_lyon_first_year = FrenchTaxSystem::NueFormulas.calc_net_taxable_property_income_amount(simulation_lyon, 0, 1)
    #     expect(result_lyon_first_year).to be_a(Hash)
    #     expect(result_lyon_first_year).to be_within(0.01).of(2_500)
    #   end
    # end

    # describe "#calc_deductible_expenses_regimen_net_taxable_property_income_amount(simulation, postponed_negative_taxable_property_income_from_previous_fiscal_year, investment_fiscal_year)" do
    #   it "returns correct values for each hash keys" do
    #     result_lyon_first_year = FrenchTaxSystem::NueFormulas.calc_deductible_expenses_regimen_net_taxable_property_income_amount(simulation_lyon, 0, 1)
    #     expect(result_lyon_first_year).to be_a(Hash)
    #     expect(result_lyon_first_year).to be_within(0.01).of(2_500)
    #   end
    # end

    describe "#calc_deductible_expenses_sum(simulation, investment_fiscal_year)" do
      it "returns deductible expenses for year 1" do
        result_lyon = FrenchTaxSystem::NueFormulas.calc_deductible_expenses_sum(simulation_lyon, 1)
        result_bordeaux = FrenchTaxSystem::NueFormulas.calc_deductible_expenses_sum(simulation_bordeaux, 1)
        result_nimes = FrenchTaxSystem::NueFormulas.calc_deductible_expenses_sum(simulation_nimes, 1)
        result_lille = FrenchTaxSystem::NueFormulas.calc_deductible_expenses_sum(simulation_lille, 1)
        result_agen = FrenchTaxSystem::NueFormulas.calc_deductible_expenses_sum(simulation_agen, 1)
        result_grenoble = FrenchTaxSystem::NueFormulas.calc_deductible_expenses_sum(simulation_grenoble, 1)
        result_toulouse = FrenchTaxSystem::NueFormulas.calc_deductible_expenses_sum(simulation_toulouse, 1)
        result_limoges = FrenchTaxSystem::NueFormulas.calc_deductible_expenses_sum(simulation_limoges, 1)
        result_rennes = FrenchTaxSystem::NueFormulas.calc_deductible_expenses_sum(simulation_rennes, 1)
        result_tours = FrenchTaxSystem::NueFormulas.calc_deductible_expenses_sum(simulation_tours, 1)
        expect(result_lyon).to be_within(0.01).of(55_607.91)
        expect(result_bordeaux).to be_within(0.01).of(8_815.08)
        expect(result_nimes).to be_within(0.01).of(156_921.46)
        expect(result_lille).to be_within(0.01).of(4_564.66)
        expect(result_agen).to be_within(0.01).of(10_313.92)
        expect(result_grenoble).to be_within(0.01).of(13_372.40)
        expect(result_toulouse).to be_within(0.01).of(2_037.72)
        expect(result_limoges).to be_within(0.01).of(39_129.20)
        expect(result_rennes).to be_within(0.01).of(58_546.17)
        expect(result_tours).to be_within(0.01).of(34_073.44)
      end

      it "returns deductible expenses for year 2" do
        result_lyon = FrenchTaxSystem::NueFormulas.calc_deductible_expenses_sum(simulation_lyon, 2)
        result_bordeaux = FrenchTaxSystem::NueFormulas.calc_deductible_expenses_sum(simulation_bordeaux, 2)
        result_nimes = FrenchTaxSystem::NueFormulas.calc_deductible_expenses_sum(simulation_nimes, 2)
        result_lille = FrenchTaxSystem::NueFormulas.calc_deductible_expenses_sum(simulation_lille, 2)
        result_agen = FrenchTaxSystem::NueFormulas.calc_deductible_expenses_sum(simulation_agen, 2)
        result_grenoble = FrenchTaxSystem::NueFormulas.calc_deductible_expenses_sum(simulation_grenoble, 2)
        result_toulouse = FrenchTaxSystem::NueFormulas.calc_deductible_expenses_sum(simulation_toulouse, 2)
        result_limoges = FrenchTaxSystem::NueFormulas.calc_deductible_expenses_sum(simulation_limoges, 2)
        result_rennes = FrenchTaxSystem::NueFormulas.calc_deductible_expenses_sum(simulation_rennes, 2)
        result_tours = FrenchTaxSystem::NueFormulas.calc_deductible_expenses_sum(simulation_tours, 2)
        expect(result_lyon).to be_within(0.01).of(15_607.91)
        expect(result_bordeaux).to be_within(0.01).of(3_815.08)
        expect(result_nimes).to be_within(0.01).of(31_921.46)
        expect(result_lille).to be_within(0.01).of(2_064.66)
        expect(result_agen).to be_within(0.01).of(10_313.92)
        expect(result_grenoble).to be_within(0.01).of(3_372.40)
        expect(result_toulouse).to be_within(0.01).of(2_037.72)
        expect(result_limoges).to be_within(0.01).of(14_129.20)
        expect(result_rennes).to be_within(0.01).of(8_546.17)
        expect(result_tours).to be_within(0.01).of(9_073.44)
      end
    end

    describe "#calc_gross_taxable_property_income_amount(simulation, deductible_expenses, postponed_negative_taxable_property_income_from_previous_fiscal_year)" do
      it "returns the gross taxable property income amount for year 1" do
        result_lyon = FrenchTaxSystem::NueFormulas.calc_gross_taxable_property_income_amount(simulation_lyon, 55_607.91, 0)
        result_bordeaux = FrenchTaxSystem::NueFormulas.calc_gross_taxable_property_income_amount(simulation_bordeaux, 8_815.08, 0)
        result_nimes = FrenchTaxSystem::NueFormulas.calc_gross_taxable_property_income_amount(simulation_nimes, 156_921.46, 0)
        result_lille = FrenchTaxSystem::NueFormulas.calc_gross_taxable_property_income_amount(simulation_lille, 4_564.66, 0)
        result_agen = FrenchTaxSystem::NueFormulas.calc_gross_taxable_property_income_amount(simulation_agen, 10_313.92, 0)
        result_grenoble = FrenchTaxSystem::NueFormulas.calc_gross_taxable_property_income_amount(simulation_grenoble, 13_372.40, 0)
        result_toulouse = FrenchTaxSystem::NueFormulas.calc_gross_taxable_property_income_amount(simulation_toulouse, 2_037.72, 0)
        result_limoges = FrenchTaxSystem::NueFormulas.calc_gross_taxable_property_income_amount(simulation_limoges, 39_129.20, 0)
        result_rennes = FrenchTaxSystem::NueFormulas.calc_gross_taxable_property_income_amount(simulation_rennes, 58_546.17, 0)
        result_tours = FrenchTaxSystem::NueFormulas.calc_gross_taxable_property_income_amount(simulation_tours, 34_073.44, 0)
        expect(result_lyon).to be_within(0.01).of(-32_407.91)
        expect(result_bordeaux).to be_within(0.01).of(-739.08)
        expect(result_nimes).to be_within(0.01).of(-82_121.46)
        expect(result_lille).to be_within(0.01).of(2_705.34)
        expect(result_agen).to be_within(0.01).of(18_630.08)
        expect(result_grenoble).to be_within(0.01).of(387.60)
        expect(result_toulouse).to be_within(0.01).of(3_470.28)
        expect(result_limoges).to be_within(0.01).of(-6_969.20)
        expect(result_rennes).to be_within(0.01).of(-32_486.17)
        expect(result_tours).to be_within(0.01).of(-9_529.44)
      end
    end

    # describe "#calc_taxable_property_income_repartition(simulation, net_taxable_property_income_amount)" do
    #   context "when net_taxable_property_income_amount is negative" do
    #     context "when net_property_income_minus_loan_interet_cost is positive AND net_taxable_property_income_amount is less than CAPPED_NEGATIVE_NET_TAXABLE_INCOME_AMOUNT" do
    #       it "returns correct values for each hash keys" do
    #         result_lyon = FrenchTaxSystem::NueFormulas.calc_taxable_property_income_repartition(simulation_lyon, -5_000)
    #         expect(result_lyon).to be_a(Hash)
    #         expect(result_lyon[:net_taxable_property_income_amount]).to be_within(0.01).of(-5_000)
    #         expect(result_lyon[:negative_taxable_property_income?]).to eq(true)
    #         expect(result_lyon[:negative_taxable_property_income_amount_to_postpone]).to be_within(0.01).of(0)
    #       end
    #     end

    #     context "when net_property_income_minus_loan_interet_cost is positive AND net_taxable_property_income_amount is less than CAPPED_NEGATIVE_NET_TAXABLE_INCOME_AMOUNT" do
    #       it "returns correct values for each hash keys" do
    #         result_lyon = FrenchTaxSystem::NueFormulas.calc_taxable_property_income_repartition(simulation_lyon, -5_000)
    #         expect(result_lyon).to be_a(Hash)
    #         expect(result_lyon[:net_taxable_property_income_amount]).to be_within(0.01).of(-5_000)
    #         expect(result_lyon[:negative_taxable_property_income?]).to eq(true)
    #         expect(result_lyon[:negative_taxable_property_income_amount_to_postpone]).to be_within(0.01).of(0)
    #       end
    #     end

    #     context "when net_property_income_minus_loan_interet_cost is negative" do
    #       it "returns correct values for each hash keys" do
    #         simulation_lyon[:credit_loan_cumulative_interests_paid_for_year_two] = 2_500
    #         result_lyon = FrenchTaxSystem::NueFormulas.calc_taxable_property_income_repartition(simulation_lyon, -5_000)
    #         expect(result_lyon).to be_a(Hash)
    #         expect(result_lyon[:net_taxable_property_income_amount]).to be_within(0.01).of(-5_000)
    #         expect(result_lyon[:negative_taxable_property_income?]).to eq(true)
    #         expect(result_lyon[:negative_taxable_property_income_amount_to_postpone]).to be_within(0.01).of(0)
    #       end
    #     end
    #   end
    # end
  end
end
