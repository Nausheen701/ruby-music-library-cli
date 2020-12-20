class Artist
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
        new_artist = self.new(name)
        new_artist.save
        new_artist
    end

    def add_song(song)
        if !self.songs.include?(song)
            self.songs << song
        end
        if !song.artist
            song.artist = self
        end
    end
   
    def genres
        self.songs.map{|song| song.genre}.uniq
    end
    #def count or self.count
    #     @@all.size
    # end

    # def self.find_by_name(name)
    #     @@all.find {|artist| artist.name == name|}
    #     @@all.detect {|artist| artist.name == name|}
    # end
end