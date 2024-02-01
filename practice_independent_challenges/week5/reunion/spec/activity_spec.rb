require './lib/activity'
require 'pry'
require 'rspec'

RSpec.describe "Activity" do
  it "exists and has attributes" do
    brunch = Activity.new("Brunch")

    expect(brunch).to be_an_instance_of(Activity)
    expect(brunch.name).to eq("Brunch")
    expect(brunch.participants).to eq({}) 
  end

  it "can add participants and their respective costs" do
    brunch = Activity.new("Brunch")

    expect(brunch.participants).to eq({}) 

    brunch.add_participant("Maria", 20)

    expect(brunch.participants).to eq({"Maria" => 20})

    brunch.add_participant("Bob", 40)

    expect(brunch.participants).to eq({"Maria" => 20, "Bob" => 40})
  end

  it "can calculate the total cost of an activity" do
    brunch = Activity.new("Brunch")
    brunch.add_participant("Maria", 20)
    brunch.add_participant("Bob", 40)

    expect(brunch.total_cost).to eq(60)

    brunch.add_participant("Jomah", 60)

    expect(brunch.total_cost).to eq(120)
  end
end