class MusicImporter
    extend Concerns::Findable
    attr_accessor :path

    def initialize(path)
        @path = path
    end
    
    def files
        @files ||= Dir.glob("#{path}/*.mp3").map {|filename| filename.gsub("#{path}/", "")}
    end

    def import
        self.files.each {|file| Song.create_from_filename(file)}
    end

end