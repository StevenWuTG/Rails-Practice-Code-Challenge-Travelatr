class Destination < ApplicationRecord
    has_many :posts
    has_many :bloggers, through: :posts

    def five_recent_posts
       recent = self.posts.sort_by{|post| post.created_at}.reverse
       return recent[0..4]
    end

    def most_liked
        test = self.posts.max_by{|post| post.likes}
    end

    def age_of_bloggers
        bloggers = self.bloggers.uniq
        sum = 0
        bloggers.each { |blogger| sum = sum + blogger.age }
        avg_age = sum / bloggers.count
        #This is ugly code, but it gets the job done. Needs refactoring.
    end
end
