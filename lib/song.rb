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
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    self.all.detect do |song|
      song.name == name
    end
  end

  def self.find_or_create_by_name(name)
    if find_by_name(name) != nil
      find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end


  def self.new_from_filename(file)
    new_song = self.new
    new_song.name = file.split("-")[1].strip.split(".")[0]
    new_song.artist_name = file.split("-")[0].strip
    new_song
  end

  def self.create_from_filename(file)
    new_song = self.create
    new_song.name = file.split("-")[1].strip.split(".")[0]
    new_song.artist_name = file.split("-")[0].strip
    new_song
  end

  def self.destroy_all
    self.all.clear
  end
end
