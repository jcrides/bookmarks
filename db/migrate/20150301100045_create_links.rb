class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :name
      t.string :url
      t.string :description
      t.references :folder, index: true

      t.timestamps null: false
    end
    add_foreign_key :links, :folders
  end
end
