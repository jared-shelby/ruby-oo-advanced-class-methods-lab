require "pry"
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    # create new song instance
    song = Song.new

    # add new song instance to class array
    self.all << song

    # return the instance added
    song
  end

  def self.new_by_name(name)
    # create new instance of a song
    song = Song.new

    # set name of song
    song.name = name

    # return song instance
    song
  end

  def self.create_by_name(name)
    # create new instance of a song, save its name, add it to all songs, and return song instance
    song = Song.new
    song.name = name
    self.all << song
    song
  end

  def self.find_by_name(name)
    # go into all songs array and select the song whose name matches the name given
    # select method will return array of instance, detect method will return the instance itself!
    self.all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) ? self.find_by_name(name) : self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    song = Song.new
    song_details = filename.split(/\ \-\ |\.mp3/)
    song.name = song_details[1]
    song.artist_name = song_details[0]
    song
  end

  def self.create_from_filename(filename)
    self.new_from_filename(filename).save
  end

  def self.destroy_all
    self.all.clear
  end
end