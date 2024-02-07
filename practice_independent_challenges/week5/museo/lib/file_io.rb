require 'csv'
require './lib/photograph'

class FileIO
  attr_reader :file_path, :parsed_csv

  def initialize(file_path)
    @parsed_csv = CSV.parse(File.read(file_path), headers: true, header_converters: :symbol)
  end

  def create_photo_objs
    @parsed_csv.map { |photo| Photograph.new(photo) }
  end

end