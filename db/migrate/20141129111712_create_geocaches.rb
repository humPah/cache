class CreateGeocaches < ActiveRecord::Migration
  def change
    create_table :geocaches do |t|
      t.string :name
      t.string :code
      t.string :description
      t.string :notes
      t.integer :user_id

      t.timestamps
    end
  end
end
