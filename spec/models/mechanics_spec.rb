require 'rails_helper'

RSpec.describe Mechanic do
  describe 'relationships' do
    it { should have_many :ride_mechanics}
    it { should have_many(:rides).through(:ride_mechanics)}
  end

  describe "class methods" do
    describe '.average_age_of_students' do
      it "shows the average years of experience across all mechanics" do
        @mechanic_1 = Mechanic.create(name: "Randy", experience: 12)
        @mechanic_2 = Mechanic.create(name: "Newman", experience: 2)

        expect(Mechanic.average_experience).to eq(7)
      end
    end
  end

  describe "instance methods" do

    describe '##return_open_rides' do
      it "returns all rides that equal true for open" do
        @mechanic_1 = Mechanic.create(name: "Randy", experience: 12)
        @ride_1 = @mechanic_1.rides.create(name: "Roller Coaster", thrill: 6, open: true)
        @ride_2 = @mechanic_1.rides.create(name: "Spinny SpaceShip", thrill: 8, open: false)

        expect(@mechanic_1.open_rides.length).to eq(1)
      end
    end

    describe '##rides_by_thrill' do
      it 'returns all rides in descending order by thrill rating' do
        @mechanic_1 = Mechanic.create(name: "Randy", experience: 12)
        @ride_1 = @mechanic_1.rides.create(name: "Roller Coaster", thrill: 6, open: true)
        @ride_2 = @mechanic_1.rides.create(name: "Spinny SpaceShip", thrill: 8, open: false)

        expect(@mechanic_1.open_rides_by_thrill.first).to eq(@ride_1)
      end
    end

  end
end
