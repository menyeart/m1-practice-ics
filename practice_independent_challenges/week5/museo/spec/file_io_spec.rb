require './lib/file_io'
require 'pry'
require 'rspec'

RSpec.describe "File IO" do
  it "exists" do
    io = FileIO.new("./data/photographs.csv")

    expect(io).to be_an_instance_of(FileIO)
  end

  it "can parse a csv file" do
    io = FileIO.new("./data/photographs.csv")
  end

  it "can turn csv entries into photo objects" do
    io = FileIO.new("./data/photographs.csv")
    csv_photos = io.parsed_csv

    expect(io.create_photo_objs).to be_a(Array)
    expect(io.create_photo_objs.count).to eq(4)
    expect(io.create_photo_objs[0]).to be_an_instance_of(Photograph)
    expect(io.create_photo_objs[0].id).to eq("1")
    expect(io.create_photo_objs[0].name).to eq("Rue Mouffetard, Paris (Boy with Bottles)")
    expect(io.create_photo_objs[0].artist_id).to eq("1")
    expect(io.create_photo_objs[0].year).to eq("1954")
  end
end