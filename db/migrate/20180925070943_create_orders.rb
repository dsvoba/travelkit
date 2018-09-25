class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :status
      t.string :token
      t.string :currency, null: false, default: 'USD'
      t.decimal :currency_rate, precision: 8, scale: 4, null: false, default: 1
      t.decimal :total, precision: 8, scale: 2, null: false, default: 0

      t.string :coingate_id
      t.string :coingate_status

      t.timestamps
    end
  end
end
