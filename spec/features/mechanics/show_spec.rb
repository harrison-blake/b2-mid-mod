require 'rails_helper'

RSpec.describe "Mechanics Index Page" do
  before(:each) do
    @mechanic_1 = Mechanic.create(name: "Randy", experience: 12)
    @ride_1 = @mechanic_1.rides.create(name: "Roller Coaster", thrill: 6, open: true)
    @ride_2 = @mechanic_1.rides.create(name: "Spinny SpaceShip", thrill: 8, open: false)
    @ride_3 = @mechanic_1.rides.create(name: "Swings", thrill: 3, open: true)
    @ride_4 = @mechanic_1.rides.create(name: "new ride", thrill: 3, open: true)

  end

  it "displays the mechanic's attributes" do
    visit "/mechanics/#{@mechanic_1.id}"

    expect(page).to have_content(@mechanic_1.name)
    expect(page).to have_content(@mechanic_1.experience)
  end

  it "shows the names of the rides this mechanic is working on" do
    visit "/mechanics/#{@mechanic_1.id}"
    expect(page).to have_content(@ride_1.name)
    expect(page).to have_content(@ride_3.name)
    expect(page).not_to have_content(@ride_2.name)
  end

  it "has a form to add a ride to the mechanics" do
    visit "/mechanics/#{@mechanic_1.id}"
    fill_in :id, with: @ride_4.id
    click_on 'Add Ride'
    expect(current_path).to eq("/mechanics/#{@mechanic_1.id}")
  end
end
