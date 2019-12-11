class Artist
  attr_accessor :name, :songs
  @@all = []
  def initialize(name)
    @name=name
    @songs=[]
    @@all<<self
  end
  def self.all
    @@all
  end
  def add_song(song)
    song.artist=self
    @songs<<song
  end
  def songs
    Song.all.select {|song| song.artist==self}
  end
  def self.find(name)
    self.all.find{|artist|artist.name==name}
  end
  def self.create(name)
    self.new(name)
  end
  def self.find_or_create_by_name(name)
    self.find(name) || self.create(name)
  end
  def print_songs
    songs_array=[]
    self.songs.each{|song|songs_array<<song.name}
    puts songs_array.join("\n")
  end
end
