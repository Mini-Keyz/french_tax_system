# frozen_string_literal: true

RSpec.describe FrenchTaxSystem do
  it "has a version number" do
    expect(FrenchTaxSystem::VERSION).not_to be nil
  end

  describe "without any property income" do
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
        fiscal_revenues_p1: 61_111,
        fiscal_revenues_p2: 50_000,
        fiscal_marital_status: "Marié / Pacsé",
        fiscal_nb_dependent_children: 3,
        fiscal_nb_alternate_custody_children: 0
      }
    end

    describe "#calc_income_tax_amount_per_year(simulation, calculation_method, investment_fiscal_year)" do
      it "returns the income tax per year" do
        result_lyon = FrenchTaxSystem.calc_income_tax_amount_per_year(simulation_lyon, "without_property_income", 2)
        result_bordeaux = FrenchTaxSystem.calc_income_tax_amount_per_year(simulation_bordeaux,
                                                                          "without_property_income", 2)
        result_nimes = FrenchTaxSystem.calc_income_tax_amount_per_year(simulation_nimes, "without_property_income", 2)
        result_lille = FrenchTaxSystem.calc_income_tax_amount_per_year(simulation_lille, "without_property_income", 2)
        result_agen = FrenchTaxSystem.calc_income_tax_amount_per_year(simulation_agen, "without_property_income", 2)
        expect(result_lyon).to be_within(1).of(10_302)
        expect(result_bordeaux).to be_within(1).of(894)
        expect(result_nimes).to be_within(1).of(19_312)
        expect(result_lille).to be_within(1).of(2_117)
        expect(result_agen).to be_within(1).of(11_731)
      end
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

      context "when it has some random property income" do
        it "returns the net taxable amount" do
          result_lyon = FrenchTaxSystem.calc_global_net_taxable_amount(simulation_lyon, 20_000)
          result_bordeaux = FrenchTaxSystem.calc_global_net_taxable_amount(simulation_bordeaux, 2_000)
          expect(result_lyon).to be_within(0.01).of(110_000)
          expect(result_bordeaux).to be_within(0.01).of(56_000)
        end
      end
    end

    describe "Fiscal nb parts and related" do
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

      describe "#calc_fiscal_nb_parts(simulation)" do
        it "returns household's fiscal parts number" do
          result_lyon = FrenchTaxSystem.calc_fiscal_nb_parts(simulation_lyon)
          result_bordeaux = FrenchTaxSystem.calc_fiscal_nb_parts(simulation_bordeaux)
          result_nimes = FrenchTaxSystem.calc_fiscal_nb_parts(simulation_nimes)
          result_lille = FrenchTaxSystem.calc_fiscal_nb_parts(simulation_lille)
          expect(result_lyon).to eq(3.5)
          expect(result_bordeaux).to eq(4)
          expect(result_nimes).to eq(4.5)
          expect(result_lille).to eq(3)

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

          result_simulation_six = FrenchTaxSystem.calc_fiscal_nb_parts(simulation_fiscal_parts_six)
          result_simulation_seven = FrenchTaxSystem.calc_fiscal_nb_parts(simulation_fiscal_parts_seven)
          result_simulation_eight = FrenchTaxSystem.calc_fiscal_nb_parts(simulation_fiscal_parts_eight)
          result_simulation_nine = FrenchTaxSystem.calc_fiscal_nb_parts(simulation_fiscal_parts_nine)
          result_simulation_ten = FrenchTaxSystem.calc_fiscal_nb_parts(simulation_fiscal_parts_ten)
          expect(result_simulation_six).to eq(3.5)
          expect(result_simulation_seven).to eq(2.5)
          expect(result_simulation_eight).to eq(2.25)
          expect(result_simulation_nine).to eq(9)
          expect(result_simulation_ten).to eq(2.75)
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

      describe "#calc_capping_due_to_fiscal_parts(simulation, fiscal_nb_parts, current_year)" do
        it "returns the maximal income tax reduction incurred from fiscal nb of parts generated by children" do
          current_year = Date.today.year

          fiscal_nb_parts_one = FrenchTaxSystem.calc_fiscal_nb_parts(simulation_fiscal_parts_one)
          fiscal_nb_parts_two = FrenchTaxSystem.calc_fiscal_nb_parts(simulation_fiscal_parts_two)
          fiscal_nb_parts_three = FrenchTaxSystem.calc_fiscal_nb_parts(simulation_fiscal_parts_three)
          fiscal_nb_parts_four = FrenchTaxSystem.calc_fiscal_nb_parts(simulation_fiscal_parts_four)
          fiscal_nb_parts_five = FrenchTaxSystem.calc_fiscal_nb_parts(simulation_fiscal_parts_five)

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
          expect(result_simulation_one).to eq(6_844)
          expect(result_simulation_two).to eq(3_704)
          expect(result_simulation_three).to eq(1_852)
          expect(result_simulation_four).to eq(24_114)
          expect(result_simulation_five).to eq(4_489)

          fiscal_nb_parts_six = FrenchTaxSystem.calc_fiscal_nb_parts(simulation_fiscal_parts_six)
          fiscal_nb_parts_seven = FrenchTaxSystem.calc_fiscal_nb_parts(simulation_fiscal_parts_seven)
          fiscal_nb_parts_eight = FrenchTaxSystem.calc_fiscal_nb_parts(simulation_fiscal_parts_eight)
          fiscal_nb_parts_nine = FrenchTaxSystem.calc_fiscal_nb_parts(simulation_fiscal_parts_nine)
          fiscal_nb_parts_ten = FrenchTaxSystem.calc_fiscal_nb_parts(simulation_fiscal_parts_ten)

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
          expect(result_simulation_six).to eq(4_710)
          expect(result_simulation_seven).to eq(1_570)
          expect(result_simulation_eight).to eq(785)
          expect(result_simulation_nine).to eq(21_980)
          expect(result_simulation_ten).to eq(2_355)
        end
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

      context "when it has some random property income" do
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
      it "returns the corresponding income tax scale on which revenues are taxed" do
        result_lyon = FrenchTaxSystem.calc_income_taxes_scale(simulation_lyon, "without_property_income", 2)
        result_bordeaux = FrenchTaxSystem.calc_income_taxes_scale(simulation_bordeaux, "without_property_income", 2)
        expect(result_lyon).to eq({ family_quotient_amount: { start_scale: 25_711, end_scale: 73_516 }, tax: 0.3 })
        expect(result_bordeaux).to eq({ family_quotient_amount: { start_scale: 10_085, end_scale: 25_710 }, tax: 0.11 })
      end
    end
  end
end
