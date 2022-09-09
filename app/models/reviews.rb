class Review < ActiveRecord::Base 
    belongs_to :user
    belongs_to :product

   def self.complete_reviews 
       all_reviews_with_users = Review.joins(:user)
   end


end