class Genre < ActiveRecord::Base
    has_many :song_genres
    has_many :songs, through: :song_genres
    has_many :artists, through: :songs 

    def slug
        name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/,'')
    end

    def self.find_by_slug(slug)
        self.all.find{|s| s.slug == slug}
    end
end