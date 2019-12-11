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
    if self.name == name
      self
    else
      self.new(name)
    end
  end
  def print_songs
    @songs
  end
end
