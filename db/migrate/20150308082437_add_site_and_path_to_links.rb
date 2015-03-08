class AddSiteAndPathToLinks < ActiveRecord::Migration
  def change
    add_column :links, :site, :string
    add_column :links, :path, :string
  end
end
