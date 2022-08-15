class AddPhotoToReviews < ActiveRecord::Migration[7.0]
  def change
    add_column :reviews, :photo, :string
  end
end
