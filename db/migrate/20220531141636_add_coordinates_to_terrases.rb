class AddCoordinatesToTerrases < ActiveRecord::Migration[6.1]
  def change
    add_column :terrases, :latitude, :float
    add_column :terrases, :longitude, :float
  end
end
