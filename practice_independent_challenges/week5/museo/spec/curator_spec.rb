require './lib/photograph'
require './lib/artist'
require './lib/curator'
require 'rspec'
require 'pry'

RSpec.describe "Curator" do
  it "exists and has attributes" do
    curator = Curator.new

    expect(curator).to be_an_instance_of(Curator)
    expect(curator.photographs).to eq([])
    expect(curator.artists).to eq([])
  end

  it "can add photographs" do
    curator = Curator.new
    photo_1 = Photograph.new({
      id: "1",      
      name: "Rue Mouffetard, Paris (Boy with Bottles)",      
      artist_id: "1",      
      year: "1954"      
    })
    photo_2 = Photograph.new({
      id: "2",      
      name: "Moonrise, Hernandez",      
      artist_id: "2",      
      year: "1941"      
    })
    
    expect(curator.photographs).to eq([])

    curator.add_photograph(photo_1)

    expect(curator.photographs).to eq([photo_1])

    curator.add_photograph(photo_2)

    expect(curator.photographs).to eq([photo_1, photo_2])
  end

  it "can add photographs" do
    curator = Curator.new
    artist_1 = Artist.new({
      id: "1",      
      name: "Henri Cartier-Bresson",      
      born: "1908",      
      died: "2004",      
      country: "France"      
    })     
    artist_2 = Artist.new({
      id: "2",      
      name: "Ansel Adams",      
      born: "1902",      
      died: "1984",      
      country: "United States"      
    })   
    
    expect(curator.artists).to eq([])

    curator.add_artist(artist_1)

    expect(curator.artists).to eq([artist_1])

    curator.add_artist(artist_2)

    expect(curator.artists).to eq([artist_1, artist_2])
  end

  it "can find artists by id" do
    curator = Curator.new
    artist_1 = Artist.new({
      id: "1",      
      name: "Henri Cartier-Bresson",      
      born: "1908",      
      died: "2004",      
      country: "France"      
    })     
    artist_2 = Artist.new({
      id: "2",      
      name: "Ansel Adams",      
      born: "1902",      
      died: "1984",      
      country: "United States"      
    })   

    curator.add_artist(artist_1)
    curator.add_artist(artist_2)

    expect(curator.find_artist_by_id("1")).to eq(artist_1)
    expect(curator.find_artist_by_id("2")).to eq(artist_2)
  end

  it "can return a list of all artists and their photographs" do
    curator = Curator.new

    artist_1 = Artist.new({
      id: "1",      
      name: "Henri Cartier-Bresson",      
      born: "1908",      
      died: "2004",      
      country: "France"      
    })     

    artist_2 = Artist.new({
      id: "2",      
      name: "Ansel Adams",      
      born: "1902",      
      died: "1984",      
      country: "United States"      
    })   
  
    photo_1 = Photograph.new({
      id: "1",
      name: "Rue Mouffetard, Paris (Boy with Bottles)",
      artist_id: "1",
      year: "1954"
    })
    
    photo_2 = Photograph.new({
      id: "2",
      name: "Monolith the Northwest Face of Half Dome",
      artist_id: "2",
      year: "1956"
    })  

    curator.add_artist(artist_1)
    curator.add_artist(artist_2)
    curator.add_photograph(photo_1)
    curator.add_photograph(photo_2)

    expect(curator.all_artists_and_photos).to eq([{"Henri Cartier-Bresson" => ["Rue Mouffetard, Paris (Boy with Bottles)"]}, {"Ansel Adams" => ["Monolith the Northwest Face of Half Dome"]}])
  end

  it "can return a list of all artists and their photographs" do
    curator = Curator.new

    artist_1 = Artist.new({
      id: "1",      
      name: "Henri Cartier-Bresson",      
      born: "1908",      
      died: "2004",      
      country: "France"      
    })     

    artist_2 = Artist.new({
      id: "2",      
      name: "Ansel Adams",      
      born: "1902",      
      died: "1984",      
      country: "United States"      
    })   
  
    photo_1 = Photograph.new({
      id: "1",
      name: "Rue Mouffetard, Paris (Boy with Bottles)",
      artist_id: "1",
      year: "1954"
    })
    
    photo_2 = Photograph.new({
      id: "2",
      name: "Monolith the Northwest Face of Half Dome",
      artist_id: "2",
      year: "1956"
    })  

    photo_3 = Photograph.new({
      id: "3",
      name: "Guy who got shot",
      artist_id: "1",
      year: "1945"
    })

    photo_4 = Photograph.new({
      id: "4",
      name: "That horse in the sierra sun",
      artist_id: "2",
      year: "1945"
    })

    curator.add_artist(artist_1)
    curator.add_artist(artist_2)
    curator.add_photograph(photo_1)
    curator.add_photograph(photo_2)
    curator.add_photograph(photo_3)

    expect(curator.artists_with_mult_photos).to eq([artist_1.name])

    curator.add_photograph(photo_4)

    expect(curator.artists_with_mult_photos).to eq([artist_1.name, artist_2.name])
  end

  it "can return a list of `Photograph`s that were taken by a photographer from that country" do
    curator = Curator.new

    artist_1 = Artist.new({
      id: "1",      
      name: "Henri Cartier-Bresson",      
      born: "1908",      
      died: "2004",      
      country: "France"      
    })     

    artist_2 = Artist.new({
      id: "2",      
      name: "Ansel Adams",      
      born: "1902",      
      died: "1984",      
      country: "United States"      
    })   
  
    photo_1 = Photograph.new({
      id: "1",
      name: "Rue Mouffetard, Paris (Boy with Bottles)",
      artist_id: "1",
      year: "1954"
    })
    
    photo_2 = Photograph.new({
      id: "2",
      name: "Monolith the Northwest Face of Half Dome",
      artist_id: "2",
      year: "1956"
    })  

    photo_3 = Photograph.new({
      id: "3",
      name: "Guy who got shot",
      artist_id: "1",
      year: "1945"
    })

    photo_4 = Photograph.new({
      id: "4",
      name: "That horse in the sierra sun",
      artist_id: "2",
      year: "1945"
    })

    curator.add_artist(artist_1)
    curator.add_artist(artist_2)
    curator.add_photograph(photo_1)
    curator.add_photograph(photo_2)
    curator.add_photograph(photo_3)
    curator.add_photograph(photo_4)

    expect(curator.photos_by_artist_origin("France")).to eq([photo_1.name, photo_3.name])
  end

  it "can take a path to a CSV file containing photographs and adds them to the `Curator`." do
    curator = Curator.new
    csv_path = "./data/photographs.csv"

    expect(curator.photographs).to eq([])

    curator.add_csv_photos(csv_path)
    
    expect(curator.photographs.length).to_not eq(0)
    expect(curator.photographs).to_not eq([])

    curator.photographs.each do |photo|
      expect(photo).to be_an_instance_of(Photograph)
      expect(photo.name).to be_a(String)
      expect(photo.id).to be_a(String)
      expect(photo.year).to be_a(String)
      expect(photo.artist_id).to be_a(String)
    end
  end

  it "can takes a range and returns an list of all photographs with a year that falls in that range" do
    curator = Curator.new

    photo_1 = Photograph.new({
      id: "1",
      name: "Rue Mouffetard, Paris (Boy with Bottles)",
      artist_id: "1",
      year: "1954"
    })
    
    photo_2 = Photograph.new({
      id: "2",
      name: "Monolith the Northwest Face of Half Dome",
      artist_id: "2",
      year: "1956"
    })  

    photo_3 = Photograph.new({
      id: "3",
      name: "Guy who got shot",
      artist_id: "1",
      year: "1945"
    })

    photo_4 = Photograph.new({
      id: "4",
      name: "That horse in the sierra sun",
      artist_id: "2",
      year: "1945"
    })

    curator.add_photograph(photo_1)
    curator.add_photograph(photo_2)
    curator.add_photograph(photo_3)
    curator.add_photograph(photo_4)

    expect(curator.photos_created_between(1950, 1960)).to eq([photo_1, photo_2])
  end

  it "can tell us a given `Artist`'s age when a photograph was taken and all the photographs they took at that age" do
    curator = Curator.new

    artist_1 = Artist.new({
      id: "1",      
      name: "Henri Cartier-Bresson",      
      born: "1908",      
      died: "2004",      
      country: "France"      
    })     

    artist_2 = Artist.new({
      id: "2",      
      name: "Ansel Adams",      
      born: "1902",      
      died: "1984",      
      country: "United States"      
    })   
  
    photo_1 = Photograph.new({
      id: "1",
      name: "Rue Mouffetard, Paris (Boy with Bottles)",
      artist_id: "1",
      year: "1954"
    })
    
    photo_2 = Photograph.new({
      id: "2",
      name: "Monolith the Northwest Face of Half Dome",
      artist_id: "2",
      year: "1956"
    })  

    photo_3 = Photograph.new({
      id: "3",
      name: "Guy who got shot",
      artist_id: "1",
      year: "1945"
    })

    photo_4 = Photograph.new({
      id: "4",
      name: "That horse in the sierra sun",
      artist_id: "2",
      year: "1945"
    })

    photo_5 = Photograph.new({
      id: "5",
      name: "That church in Santa Fe",
      artist_id: "2",
      year: "1945"
    })

    curator.add_artist(artist_1)
    curator.add_artist(artist_2)
    curator.add_photograph(photo_1)
    curator.add_photograph(photo_2)
    curator.add_photograph(photo_3)
    curator.add_photograph(photo_4)

    expect(curator.artists_age_and_same_year_photos(photo_4)).to eq({"age" => 43, "photos" => [photo_4]})

    curator.add_photograph(photo_5)

    expect(curator.artists_age_and_same_year_photos(photo_4)).to eq({"age" => 43, "photos" => [photo_4, photo_5]})
  end
end