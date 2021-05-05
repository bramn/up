class CreateMenuItems < ActiveRecord::Migration[6.1]
  def change
    create_table :menu_items do |t|
      t.string :name
      t.string :icon
      t.references :page, null: false, foreign_key: true
      t.integer :order

      t.timestamps
    end
  end
end
