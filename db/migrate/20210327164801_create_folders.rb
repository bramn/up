class CreateFolders < ActiveRecord::Migration[6.1]
  def change
    create_table :folders do |t|
      t.string :path
      t.string :base_name
      t.integer :parent_folder_id

      t.timestamps
    end
  end
end
