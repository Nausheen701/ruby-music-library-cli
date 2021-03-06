module Concerns::Findable
   
    def find_by_name(name)
        self.all.find {|o| o.name == name}
    end

    def find_or_create_by_name(o)
        self.find_by_name(o) || self.create(o)
    end

end