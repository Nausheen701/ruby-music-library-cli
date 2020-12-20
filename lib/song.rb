require 'pry'
class Song
    extend Concerns::Findable
    attr_accessor :name, :artist, :genre
    @@all = []

    def initialize(name, artist=nil, genre=nil)
        @name = name
        @artist = artist
        @genre = genre
        if artist
            self.artist = artist
        end
        if genre
            self.genre = genre
        end
        #save
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
        new_song = self.new(name) #initializes the new song
        new_song.save #saves new song
        new_song #returns new song
    end

    def artist=(artist)
        @artist = artist
        artist.add_song(self)
    end

    def genre=(genre)
        @genre = genre
        genre.add_song(self)
    end

    def self.new_from_filename(filename)
        array = filename.split(/ - |\./)
        a = Artist.find_or_create_by_name(array[0])
        g = Genre.find_or_create_by_name(array[2])
        sn = array[1]
        new_song = Song.new(sn, a, g)
        new_song
    end
    
    def self.create_from_filename(filename)
        new_song = self.new_from_filename(filename)
        new_song.save
        new_song
    end
#     def self.find_by_name(name)
#         self.all.find {|song| song.name == name}
#    end

#    def self.find_or_create_by_name(name)
#     if find_by_name(name) 
#      find_by_name(name) 
#     else
#      create(name)
#     end
#    end

   
   

end 
   
     