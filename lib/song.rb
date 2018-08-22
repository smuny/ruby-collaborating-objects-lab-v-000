require 'pry'
class Song
  
  attr_accessor :name, :artist
  
  @@all = []
  
  def initialize(name)
    @name = name
  end
  
  def save
    @@all << self
    self
  end
  
  def artist=(artist)
    self.artist = Artist.find_or_create_by_name(artist)
    artist.add_song(self)
  end
  
  def self.new_by_filename(filename)
    elements = filename.split(" - ")
    artist = elements[0]
    song = elements[1]
    newsong = Song.new(song)
    newsong.artist_name = artist

    newsong.save
    # newsong.artist = Artist.create(artist)
    # newsong.artist.add_song(song)
    newsong 
  end
end
