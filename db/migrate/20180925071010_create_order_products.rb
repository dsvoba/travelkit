class CreateOrderProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :order_products do |t|
      t.references :order, null: false, index: true
      t.references :product, null: false, index: true
      t.decimal :price, null: false, precision: 8, scale: 2
      t.integer :quantity, null: false, limit: 2

      t.timestamps
    end
  end
end
