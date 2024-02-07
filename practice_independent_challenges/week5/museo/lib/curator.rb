require "./lib/file_io"

class Curator
  attr_reader :photographs,
              :artists

  def initialize
    @photographs = []
    @artists = []
  end

  def add_photograph(photo)
    @photographs << photo
  end

  def add_artist(artist)
    @artists << artist
  end

  def find_artist_by_id(id)
    @artists.find { |artist| artist.id == id}
  end

  def all_artists_and_photos
    @artists.map { |artist| {artist.name => get_artists_photos(artist) } }
  end

  def get_artists_photos(artist)
    @photographs.find_all { |photo| photo.artist_id == artist.id}.map { |photo| photo.name}
  end

  def artists_with_mult_photos
    all_artists_and_photos.map do |art_photos| 
      art_photos.keys[0] if art_photos.values.flatten.count > 1
    end.compact
  end

  def photos_by_artist_origin(origin)
    ids = artist_ids_by_country(origin)
    all_photos_by_ids(ids)
  end

  def artist_ids_by_country(country)
    @artists.map { |artist| artist.id if artist.country == country}.compact
  end

  def all_photos_by_ids(ids)
    photos = @photographs.find_all { |photo| ids.include?(photo.artist_id)}
    photos.map { |photo| photo.name}
  end

  def add_csv_photos(csv_path)
    FileIO.new(csv_path).create_photo_objs.each { |photo| @photographs << photo }
  end

  def photos_created_between(start_year, end_year)
    @photographs.map do |photo| 
      photo if photo.year.to_i.between?(start_year, end_year)
    end.compact
  end

  def artist_by_id(id)
    @artists.find { |artist| artist.id == id }
  end

  def artist_age_when_created(artist, photo)
    photo.year.to_i - artist.born.to_i
  end

  def artists_photos_by_year(artist, year)
    @photographs.find_all do |photograph|
      photograph.year == year && photograph.artist_id == artist.id
    end
  end

  def artists_age_and_same_year_photos(photo)
    artist = artist_by_id(photo.artist_id)
    {
      "age" => artist_age_when_created(artist, photo),
      "photos" => artists_photos_by_year(artist, photo.year)
    }
  end
end