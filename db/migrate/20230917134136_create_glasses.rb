class CreateGlasses < ActiveRecord::Migration[7.0]
  def change
    create_table :glasses do |t|
      t.string  :SKU, null: false
      t.string  :name
      t.string  :brand, null: false
      t.float   :price, null: false
      t.string  :color, null: false
      t.string  :frame, null: false
      t.string  :material, null: false
      t.string  :measure, null: false
      t.boolean :woman, default: false
      t.boolean :man, default: false

      t.timestamps
    end
  end
end
