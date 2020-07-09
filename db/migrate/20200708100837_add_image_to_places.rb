class AddImageToPlaces < ActiveRecord::Migration[6.0]
  def change
    add_column :places, :image, :text
  end
end
