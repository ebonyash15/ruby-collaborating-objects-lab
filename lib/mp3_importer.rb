class MP3Importer
  attr_accessor :path, :filenames
  def initialize(path)
    @path=path
  end
  def files
      @files ||= Dir.entries(@path).select do |song|
      !File.directory?(song) && song.end_with?(".mp3")
    end
  end
  def import
    self.files.each {|filename| Song.new_by_filename(filename)}
  end
end
