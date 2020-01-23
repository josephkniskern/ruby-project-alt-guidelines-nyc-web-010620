class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.integer :buyer_id
      t.integer :listing_id
      # ADD COMMENT COl

      t.timestamp
    end
  end
end
