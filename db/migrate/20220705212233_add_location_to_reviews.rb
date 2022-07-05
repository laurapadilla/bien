class AddLocationToReviews < ActiveRecord::Migration[7.0]
  def change
    add_column :reviews, :address, :text
    add_column :reviews, :latitude, :float
    add_column :reviews, :longitude, :float
  end
end
