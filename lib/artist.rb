class Artist
  attr_accessor :name
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
    @songs<<self
  end
  def songs
    Song.all.select {|song| song.artist==self}
  end
  def self.find_or_create_by_name(name)
    self.name == name || name = self.new(name)
  end
  def print_songs
    @songs
  end
end
