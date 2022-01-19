class Show < ActiveRecord::Base
    def self.highest_rating
        maximum('rating')
    end

    def self.most_popular_show
        find_by(rating: self.highest_rating)
        # where("rating = ?", self.highest_rating).first # .where syntax from solutions branch
    end

    def self.lowest_rating
        minimum('rating')
    end
    
    def self.least_popular_show
        # find_by(rating: self.lowest_rating)
        where("rating = ?", self.lowest_rating).first # .where syntax from solutions branch
    end

    def self.ratings_sum
        sum(:rating)
    end

    def self.popular_shows
        # where(rating: 6..10)
        where("rating >= ?",5) # syntax from solutions branch - documentation wasn't very clear on this
    end

    def self.shows_by_alphabetical_order
        self.order(:name)
    end
end