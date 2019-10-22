# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_10_22_141752) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "product_articles", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.string "sku"
    t.string "price"
    t.bigint "product_id"
    t.integer "parent_article_id"
    t.index ["product_id"], name: "index_product_articles_on_product_id"
  end

  create_table "product_photos", force: :cascade do |t|
    t.string "url"
    t.bigint "product_article_id"
    t.index ["product_article_id"], name: "index_product_photos_on_product_article_id"
  end

  create_table "product_sizes", force: :cascade do |t|
    t.string "sku"
    t.boolean "available"
    t.bigint "product_article_id"
    t.bigint "size_id"
    t.index ["product_article_id"], name: "index_product_sizes_on_product_article_id"
    t.index ["size_id"], name: "index_product_sizes_on_size_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.string "sku"
  end

  create_table "sizes", force: :cascade do |t|
    t.string "name"
  end

end
