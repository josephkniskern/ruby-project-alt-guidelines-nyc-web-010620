class Buyer < ActiveRecord::Base
  has_many :favorites
  has_many :listings, through: :favorites
end