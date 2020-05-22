class Episode < ApplicationRecord
  has_many :appearances
  has_many :guests, through: :appearances

  def average_rating
    ratings = self.appearances.map {|a| a.rating}
    ratings.inject{ |sum, el| sum + el }.to_f / ratings.size
  end
end
