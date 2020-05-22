class Appearance < ApplicationRecord
    belong_to :guest
    belong_to :episode

    RATINGS = []

    def rating
        RATINGS << @rating
    end

end