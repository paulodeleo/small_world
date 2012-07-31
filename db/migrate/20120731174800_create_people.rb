class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name,:null => false, :unique => true
      t.float :latitude, :null => false, :unique => true
      t.float :longitude, :null => false, :unique => true
      t.boolean :gmaps, :null => false, :default => true

      t.timestamps
    end
  end
end
