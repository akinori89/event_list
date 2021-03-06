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

ActiveRecord::Schema.define(version: 20160910105450) do

  create_table "categories", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "event_details", force: :cascade do |t|
    t.integer  "event_id",   limit: 4,                null: false
    t.integer  "price",      limit: 4,    default: 0, null: false
    t.string   "access",     limit: 200
    t.string   "caution",    limit: 3000
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  create_table "events", force: :cascade do |t|
    t.integer  "user_id",       limit: 4,                 null: false
    t.integer  "prefecture_id", limit: 4,    default: 48, null: false
    t.string   "name",          limit: 255,  default: "", null: false
    t.string   "place",         limit: 255,  default: "", null: false
    t.datetime "start_date",                              null: false
    t.datetime "end_date",                                null: false
    t.string   "url",           limit: 255,  default: "", null: false
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "desc",          limit: 3000
    t.string   "thumb",         limit: 255
    t.integer  "likes_count",   limit: 4,    default: 0,  null: false
    t.integer  "category_id",   limit: 4
  end

  add_index "events", ["category_id"], name: "index_events_on_category_id", using: :btree
  add_index "events", ["end_date"], name: "index_events_on_end_date", using: :btree
  add_index "events", ["name"], name: "index_events_on_name", using: :btree
  add_index "events", ["prefecture_id"], name: "index_events_on_prefecture_id", using: :btree
  add_index "events", ["start_date"], name: "index_events_on_start_date", using: :btree
  add_index "events", ["user_id"], name: "index_events_on_user_id", using: :btree

  create_table "follows", force: :cascade do |t|
    t.integer  "user_id",    limit: 4, null: false
    t.integer  "target_id",  limit: 4, null: false
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "follows", ["target_id"], name: "index_follows_on_target_id", using: :btree
  add_index "follows", ["user_id", "target_id"], name: "index_follows_on_user_id_and_target_id", unique: true, using: :btree

  create_table "likes", force: :cascade do |t|
    t.integer  "user_id",    limit: 4, null: false
    t.integer  "event_id",   limit: 4, null: false
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "prefectures", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "prefectures", ["name"], name: "index_prefectures_on_name", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name",          limit: 255, default: "",                    null: false
    t.string   "uuid",          limit: 255,                                 null: false
    t.integer  "sex",           limit: 4,   default: 2
    t.datetime "birthday",                  default: '2016-05-01 14:03:33', null: false
    t.string   "desc",          limit: 255, default: ""
    t.string   "url",           limit: 200, default: ""
    t.integer  "publish",       limit: 4,   default: 0
    t.integer  "prefecture_id", limit: 4,   default: 48,                    null: false
    t.datetime "created_at",                                                null: false
    t.datetime "updated_at",                                                null: false
    t.string   "avatar",        limit: 255
    t.string   "bg_image",      limit: 255
  end

  add_index "users", ["prefecture_id"], name: "index_users_on_prefecture_id", using: :btree
  add_index "users", ["sex"], name: "index_users_on_sex", using: :btree
  add_index "users", ["uuid"], name: "index_users_on_uuid", unique: true, using: :btree

end
