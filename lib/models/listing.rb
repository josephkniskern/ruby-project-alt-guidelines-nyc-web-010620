class Listing < ActiveRecord::Base
  has_many :favorites
  has_many :buyers, through: :favorites
end