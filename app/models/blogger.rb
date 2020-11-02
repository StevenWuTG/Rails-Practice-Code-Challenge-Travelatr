class Blogger < ApplicationRecord
    has_many :posts
    has_many :destinations, through: :posts

    validates :name, uniqueness: true
    validates :age, numericality: { greater_than: 0 }
    validates :bio, length: { minimum: 30 }

    def featured_post
        self.posts.max_by { |post| post.likes }
    end

    def total_likes
        sum = 0
        self.posts.each { |post| sum = sum + post.likes}
        return sum
    end

    def top_five
        # sorted_destinations = self.posts.group_by {|post| post.destination}
        # sorted_destinations. do |destination, array_of_posts|
        #     array_of_posts.
        # byebug
        
        self.destinations.distinct.sort_by do |destination|
            destination.posts.select do |post|
                post.blogger == self 
            end.count
        end.reverse.first(5)
        
    end

end
