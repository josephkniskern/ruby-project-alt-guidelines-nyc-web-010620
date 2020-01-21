class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|
      t.integer :price
      t.integer :zipcode
      t.string :description

      t.timestamp
    end
  end
end
