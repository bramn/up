class AddFolderToPages < ActiveRecord::Migration[6.1]
  def change
    add_reference :pages, :folder, foreign_key: true
  end
end
