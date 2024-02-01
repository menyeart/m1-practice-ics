require './lib/reunion'
require './lib/activity'
require 'rspec'
require 'pry'

RSpec.describe "Reuntion" do

  it "exists and has attributes" do
    reunion = Reunion.new("1406 BE")

    expect(reunion).to be_an_instance_of(Reunion)
    expect(reunion.name).to eq("1406 BE")
    expect(reunion.activities).to eq([])
  end

  it "it can add activities" do
    reunion = Reunion.new("1406 BE")
    brunch = Activity.new("Brunch")

    expect(reunion.activities).to eq([])

    reunion.add_activity(brunch)

    expect(reunion.activities).to eq([brunch])
  end

end