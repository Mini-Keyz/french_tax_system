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
      credit_loan_cumulative_interests_paid_for_year_two: 1_200,
      credit_loan_insurance_amount_per_year: 500,
      fiscal_regimen: "Réel"
    }
  end

  let(:simulation_arles) do
    {
      house_rent_amount_per_year: 12_000,
      house_first_works_amount: 5_000,
      house_landlord_charges_amount_per_year: 0,
      house_property_management_amount_per_year: 0,
      house_insurance_gli_amount_per_year: 420,
      house_insurance_pno_amount_per_year: 100,
      house_property_tax_amount_per_year: 1_000,
      credit_loan_cumulative_interests_paid_for_year_two: 2_800,
      credit_loan_insurance_amount_per_year: 600,
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
  end

  describe "For 'Reel' fiscal regimen" do
    describe "#calc_net_taxable_property_income_amount(simulation, postponed_negative_taxable_property_income_from_previous_fiscal_year, investment_fiscal_year)" do
      context "when the simulation fiscal_regimen is 'Forfait'" do
        it "returns the net taxable property income amount incurred from the potentiel investment for any year" do
          result_toulon_first_year = FrenchTaxSystem::NueFormulas.calc_net_taxable_property_income_amount(simulation_toulon, 0, 1)
          result_toulon_second_year = FrenchTaxSystem::NueFormulas.calc_net_taxable_property_income_amount(simulation_toulon, 0, 2)
          result_toulon_tenth_year = FrenchTaxSystem::NueFormulas.calc_net_taxable_property_income_amount(simulation_toulon, 0, 10)
          expect(result_toulon_first_year).to be_a(Hash)
          expect(result_toulon_first_year[:fiscal_year1][:net_taxable_property_income_amount]).to be_within(0.01).of(8_400)
          expect(result_toulon_second_year).to be_a(Hash)
          expect(result_toulon_second_year[:fiscal_year2][:net_taxable_property_income_amount]).to be_within(0.01).of(8_400)
          expect(result_toulon_tenth_year).to be_a(Hash)
          expect(result_toulon_tenth_year[:fiscal_year10][:net_taxable_property_income_amount]).to be_within(0.01).of(8_400)

          result_la_ciotat_fifteenth_year = FrenchTaxSystem::NueFormulas.calc_net_taxable_property_income_amount(simulation_la_ciotat, 0, 15)
          expect(result_la_ciotat_fifteenth_year[:fiscal_year15][:net_taxable_property_income_amount]).to be_within(0.01).of(1_680)
        end
      end

      context "when the simulation fiscal_regimen is 'Réel' (the difficult one!)" do
        it "returns the net taxable property income amount incurred from the potential investment" do
          result_lyon_first_year = FrenchTaxSystem::NueFormulas.calc_net_taxable_property_income_amount(simulation_lyon, 0, 1)
          expect(result_lyon_first_year).to be_a(Hash)
          expect(result_lyon_first_year).to be_within(0.01).of(2500)
        end
      end
    end

    describe "#calc_flat_rate_regimen_net_taxable_property_income_amount(simulation)" do
      it "returns the net taxable property income amount for a simulation which is made with fiscal_regimen == 'Forfait'" do
        result_toulon = FrenchTaxSystem::NueFormulas.calc_flat_rate_regimen_net_taxable_property_income_amount(simulation_toulon)
        expect(result_toulon[:net_taxable_property_income_amount]).to be_within(0.01).of(8_400)

        result_la_ciotat = FrenchTaxSystem::NueFormulas.calc_flat_rate_regimen_net_taxable_property_income_amount(simulation_la_ciotat)
        expect(result_la_ciotat[:net_taxable_property_income_amount]).to be_within(0.01).of(1_680)
      end
    end

    describe "#calc_deductible_expenses_regimen_net_taxable_property_income_amount(simulation, postponed_negative_taxable_property_income_from_previous_fiscal_year, investment_fiscal_year)" do
      it "returns correct values for each hash keys" do
        result_lyon_first_year = FrenchTaxSystem::NueFormulas.calc_deductible_expenses_regimen_net_taxable_property_income_amount(simulation_lyon, 0, 1)
        expect(result_lyon_first_year).to be_a(Hash)
        expect(result_lyon_first_year).to be_within(0.01).of(2500)
      end
    end

    describe "#calc_taxable_property_income_repartition(simulation, net_taxable_property_income_amount)" do
      context "when net_taxable_property_income_amount is negative" do
        context "when net_property_income_minus_loan_interet_cost is positive AND net_taxable_property_income_amount is less than CAPPED_NEGATIVE_NET_TAXABLE_INCOME_AMOUNT" do
          it "returns correct values for each hash keys" do
            result_lyon = FrenchTaxSystem::NueFormulas.calc_taxable_property_income_repartition(simulation_lyon, -5_000)
            expect(result_lyon).to be_a(Hash)
            expect(result_lyon[:net_taxable_property_income_amount]).to be_within(0.01).of(-5_000)
            expect(result_lyon[:negative_taxable_property_income?]).to eq(true)
            expect(result_lyon[:negative_taxable_property_income_amount_to_postpone]).to be_within(0.01).of(0)
          end
        end

        context "when net_property_income_minus_loan_interet_cost is positive AND net_taxable_property_income_amount is less than CAPPED_NEGATIVE_NET_TAXABLE_INCOME_AMOUNT" do
          it "returns correct values for each hash keys" do
            result_lyon = FrenchTaxSystem::NueFormulas.calc_taxable_property_income_repartition(simulation_lyon, -5_000)
            expect(result_lyon).to be_a(Hash)
            expect(result_lyon[:net_taxable_property_income_amount]).to be_within(0.01).of(-5_000)
            expect(result_lyon[:negative_taxable_property_income?]).to eq(true)
            expect(result_lyon[:negative_taxable_property_income_amount_to_postpone]).to be_within(0.01).of(0)
          end
        end

        context "when net_property_income_minus_loan_interet_cost is negative" do
          it "returns correct values for each hash keys" do
            simulation_lyon[:credit_loan_cumulative_interests_paid_for_year_two] = 2_500
            result_lyon = FrenchTaxSystem::NueFormulas.calc_taxable_property_income_repartition(simulation_lyon, -5_000)
            expect(result_lyon).to be_a(Hash)
            expect(result_lyon[:net_taxable_property_income_amount]).to be_within(0.01).of(-5_000)
            expect(result_lyon[:negative_taxable_property_income?]).to eq(true)
            expect(result_lyon[:negative_taxable_property_income_amount_to_postpone]).to be_within(0.01).of(0)
          end
        end
      end
    end
  end
end
