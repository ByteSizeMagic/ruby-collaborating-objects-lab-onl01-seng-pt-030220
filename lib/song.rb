class Song

  attr_accessor :name, :artist

  @@all = []


  def initialize(name)
    @name = name
    @@all << self
    @artist
  end

  def self.all
    @@all
  end

  def artist_name
    artist.name if artist
  end

  def self.new_by_filename(filename)
    song = filename.split(" - ")
    title = song[1]
    artist_name = song[0]
    song = Song.new(title)
    song.artist_name=(artist_name)
    song
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by_name(name)
    artist.add_song(self)
  end


end
