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

ActiveRecord::Schema.define(version: 20150317050841) do

  create_table "videos", force: :cascade do |t|
    t.string   "title"
    t.string   "shortDescription"
    t.string   "longDescription"
    t.string   "liveBroadcastTime"
    t.string   "showTitle"
    t.string   "channelTitle"
    t.string   "season"
    t.string   "episode"
    t.string   "duration"
    t.string   "parentalGuidance"
    t.string   "logo_image"
    t.string   "userVideoDetails"
    t.string   "template_image"
    t.string   "show"
    t.string   "channel"
    t.string   "self"
    t.string   "publisher"
    t.string   "default_image"
    t.string   "cell_image"
    t.string   "channel_subscription_status"
    t.string   "showId"
    t.string   "channelId"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

end
