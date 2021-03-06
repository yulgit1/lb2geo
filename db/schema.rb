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

ActiveRecord::Schema.define(version: 20170126164031) do

  create_table "geoobjects", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "oid"
    t.integer  "_oid"
    t.integer  "level"
    t.string   "pid"
    t.datetime "orig_date"
    t.string   "test_handle"
    t.string   "prod_handle"
    t.datetime "last_process_start"
    t.datetime "last_process_end"
    t.integer  "processed_index"
    t.text     "error",              limit: 65535
    t.string   "processed"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "zindex"
  end

end
