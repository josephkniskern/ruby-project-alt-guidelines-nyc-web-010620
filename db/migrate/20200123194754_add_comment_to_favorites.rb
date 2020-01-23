class AddCommentToFavorites < ActiveRecord::Migration[5.2]
  def change
    add_column :favorites, :comment, :string
  end
end
