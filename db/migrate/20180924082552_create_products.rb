class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.decimal :price, null: false, precision: 8, scale: 2
      t.string :image

      t.timestamps
    end
  end
end
