class AddSpotToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :address, :string, default: ''
    add_column :posts, :latitude, :float
    add_column :posts, :longitude, :float
    change_column :posts, :address, :string, null: false
  end
end
