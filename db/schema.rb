# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_09_17_134251) do
  create_table "carts", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.boolean "business", default: false
    t.integer "partita_iva"
    t.string "business_name"
    t.string "address", null: false
    t.integer "cap", null: false
    t.string "city", null: false
    t.float "total_price", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "glasses", force: :cascade do |t|
    t.string "sku", null: false
    t.string "name"
    t.string "brand", null: false
    t.float "price", null: false
    t.string "color", null: false
    t.string "frame", null: false
    t.string "material", null: false
    t.string "measure", null: false
    t.boolean "woman", default: false
    t.boolean "man", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer "glass_id", null: false
    t.integer "cart_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cart_id"], name: "index_orders_on_cart_id"
    t.index ["glass_id"], name: "index_orders_on_glass_id"
  end

  add_foreign_key "orders", "carts"
  add_foreign_key "orders", "glasses"
end
