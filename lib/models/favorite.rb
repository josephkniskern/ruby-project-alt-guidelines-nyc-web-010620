class Favorite < ActiveRecord::Base
  belongs_to :buyer
  belongs_to :listing
end