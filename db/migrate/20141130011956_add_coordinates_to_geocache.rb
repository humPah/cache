class AddCoordinatesToGeocache < ActiveRecord::Migration
  def change
    add_column :geocaches, :coordinates, :string
  end
end
