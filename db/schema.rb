# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140219181846) do

  create_table "admin_users", force: true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: true do |t|
    t.text     "body"
    t.integer  "post_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["post_id"], name: "index_comments_on_post_id"

  create_table "order_items", force: true do |t|
    t.integer  "order_id"
    t.integer  "product_id"
    t.decimal  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "quantity"
  end

  add_index "order_items", ["order_id"], name: "index_order_items_on_order_id"
  add_index "order_items", ["product_id"], name: "index_order_items_on_product_id"

  create_table "orders", force: true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "orders", ["user_id"], name: "index_orders_on_user_id"

  create_table "posts", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "category_id"
    t.integer  "votes_up",    default: 0
    t.integer  "votes_down",  default: 0
  end

  add_index "posts", ["category_id"], name: "index_posts_on_category_id"

  create_table "products", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.decimal  "price"
    t.string   "image_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "token"
    t.boolean  "activated",       default: false
  end

end
