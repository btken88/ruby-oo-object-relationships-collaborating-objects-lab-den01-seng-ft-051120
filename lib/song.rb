require 'pry'

class Song
  attr_accessor :name, :artist
  @@all = []

  def initialize name
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.new_by_filename filename
    artist = filename.split(' - ')[0]
    song = filename.split(' - ')[1]
    genre = filename.split(' - ')[2]
    new_song = Song.new song
    new_song.artist_name = artist
    new_song
  end

  def artist_name=(artist_name)
    self.artist = Artist.find_or_create_by_name artist_name
  end
end