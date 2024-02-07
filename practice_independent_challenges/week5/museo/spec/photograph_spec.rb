require './lib/photograph'
require 'pry'
require 'rspec'

RSpec.describe "Photograph" do
  it "exists and has attributes" do
    attributes = {
      id: "1",
      name: "Rue Mouffetard, Paris (Boy with Bottles)",
      artist_id: "4",
      year: "1954"
    }      
    photo = Photograph.new(attributes)

    expect(photo).to be_an_instance_of(Photograph)
    expect(photo.id).to eq("1")
    expect(photo.name).to eq("Rue Mouffetard, Paris (Boy with Bottles)")
    expect(photo.artist_id).to eq("4")
    expect(photo.year).to eq("1954")
  end
end