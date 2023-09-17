class CreateCarts < ActiveRecord::Migration[7.0]
  def change
    create_table :carts do |t|
      t.string  :name
      t.string  :surname
      t.boolean :business, default: false
      t.integer :partita_iva
      t.string  :business_name
      t.string  :address, null: false
      t.integer :CAP, null: false
      t.string  :city, null: false
      t.float   :total_price, null: false

      t.timestamps
    end
  end
end
