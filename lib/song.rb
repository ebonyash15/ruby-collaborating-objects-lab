class Song
  attr_accessor :name, :artist
  @@all=[]
  def initialize(name)
    @name=name
    @@all<<self
  end
  def self.all
    @@all
  end
  def artist_name=(name)
    #if (self.artist.nil?)
    #self.artist = Artist.new(name)
    #else
    #self.artist.name=name
    #end
    self.artist.find_or_create_by_name(name)
    self.artist.add_song(self)
  end
  def self.new_by_filename(filename)
    song = self.new
    song.title = filename.split(" - ")[1]
    song.artist_name = filename.split(" - ")[0]
    song
  end
  def add_song(song)
    song.artist=self
  end
  def songs
    Songs.all.select {|song| song.artist==self}
  end
end
