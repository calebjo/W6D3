class ChangeTables < ActiveRecord::Migration[5.2]
  def change
    add_index :artwork_shares, [:viewer_id, :artwork_id], unique: true  
    add_index :artworks, [:artist_id, :title], unique: true
  end
end
