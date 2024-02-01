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

  it "determine the total cost of the event" do
    reunion = Reunion.new("1406 BE")

    brunch = Activity.new("Brunch")
    brunch.add_participant("Matt", 40)
    brunch.add_participant("Sunita", 35)

    boating = Activity.new("Boating")
    boating.add_participant("Sunita", 150)
    boating.add_participant("Matt", 30)

    photo_booth = Activity.new("Photo Booth")
    photo_booth.add_participant("Sunita", 10)
    photo_booth.add_participant("Matt", 10)

    reunion.add_activity(brunch)
    reunion.add_activity(boating)
    
    expect(reunion.total_cost).to eq(255)

    reunion.add_activity(photo_booth)

    expect(reunion.total_cost).to eq(275)
  end

  it "tell us each particiapnt's name and what they owe for the whole reunion" do
    reunion = Reunion.new("1406 BE")

    brunch = Activity.new("Brunch")
    brunch.add_participant("Matt", 40)
    brunch.add_participant("Sunita", 30)

    boating = Activity.new("Boating")
    boating.add_participant("Sunita", 150)
    boating.add_participant("Matt", 30)

    photo_booth = Activity.new("Photo Booth")
    photo_booth.add_participant("Sunita", 10)
    photo_booth.add_participant("Matt", 10)

    reunion.add_activity(brunch)
    reunion.add_activity(boating)
    reunion.add_activity(photo_booth)

    expect(reunion.cost_breakdown).to eq({"Matt" => 55, "Sunita" => -55})
  end

  it "print a summary of every person what they owe" do
    reunion = Reunion.new("1406 BE")

    brunch = Activity.new("Brunch")
    brunch.add_participant("Matt", 40)
    brunch.add_participant("Sunita", 30)

    boating = Activity.new("Boating")
    boating.add_participant("Sunita", 150)
    boating.add_participant("Matt", 30)

    photo_booth = Activity.new("Photo Booth")
    photo_booth.add_participant("Sunita", 10)
    photo_booth.add_participant("Matt", 10)

    reunion.add_activity(brunch)
    reunion.add_activity(boating)
    reunion.add_activity(photo_booth)

    expect {reunion.print_summary}.to output("Matt owes $55\nSunita owes $-55\n").to_stdout
  end
end