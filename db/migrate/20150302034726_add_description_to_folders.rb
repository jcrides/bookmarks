class AddDescriptionToFolders < ActiveRecord::Migration
  def change
    add_column :folders, :description, :string
  end
end
