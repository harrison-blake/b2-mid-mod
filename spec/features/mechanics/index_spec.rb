require 'rails_helper'

RSpec.describe "Mechanics Index Page" do
  before(:each) do
    @mechanic_1 = Mechanic.create(name: "Randy", experience: 12)
    @mechanic_2 = Mechanic.create(name: "Newman", experience: 2)
  end

  it "displays a header saying 'All Mechanics'" do
    visit "/mechanics"

    expect(page).to have_content('All Mechanics')
  end

  it "displays all mechanics names and their years of experience" do
    visit "/mechanics"

    within(".mechanic-#{@mechanic_1.id}") do
      expect(page).to have_content(@mechanic_1.name)
      expect(page).to have_content(@mechanic_1.experience)
    end

    within(".mechanic-#{@mechanic_2.id}") do
      expect(page).to have_content(@mechanic_2.name)
      expect(page).to have_content(@mechanic_2.experience)
    end
  end

  it "shows the average years of experience across all mechanics" do
    visit "/mechanics"

    expect(page).to have_content("Average experience across all Mechanics: 7.0")
  end
end
