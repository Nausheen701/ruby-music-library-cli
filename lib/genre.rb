class Genre
    extend Concerns::Findable
    attr_accessor :name, :songs

    @@all = []

    def initialize(name)
        @name = name
        @songs = []
        save
    end

    def save
        @@all << self
    end

    def self.all
        @@all 
    end

    def self.destroy_all
       @@all.clear
    end

    def self.create(name)
        new_genre = self.new(name)
        new_genre.save
        new_genre
    end

    def artists
        songs.map {|song| song.artist}.uniq
    end

    def add_song(song)
        if !self.songs.include?(song)
            self.songs << song
        end
        if !song.genre
            song.genre = self
        end
    end

    #def count or self.count
    #     @@all.size
    # end

    #  def self.find_by_name(name)
    #      @@all.find {|genre| genre.name == name|}
    #  end
end