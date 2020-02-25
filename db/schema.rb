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

ActiveRecord::Schema.define(version: 2020_02_25_012308) do

  create_table "active_storage_attachments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "packages", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci", force: :cascade do |t|
    t.float "weight"
    t.string "size"
    t.text "description"
    t.float "est_value"
    t.string "destination"
    t.string "origin"
    t.integer "sender_id"
    t.integer "traveler_id"
    t.integer "trip_id"
    t.string "receiver_fullname"
    t.string "receiver_phone"
    t.text "reveiver_extra"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["sender_id", "traveler_id"], name: "index_packages_on_sender_id_and_traveler_id"
    t.index ["trip_id", "receiver_fullname"], name: "index_packages_on_trip_id_and_receiver_fullname"
  end

  create_table "trips", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci", force: :cascade do |t|
    t.string "travel_from"
    t.date "travel_from_local_date"
    t.string "travel_to"
    t.date "travel_to_local_date"
    t.boolean "return", default: false
    t.string "retrun_from"
    t.date "return_from_local_date"
    t.string "return_to"
    t.date "retrun_to_local_time"
    t.string "travel_size"
    t.string "return_size"
    t.integer "sender_id"
    t.integer "traveler_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name", limit: 25
    t.string "last_name", limit: 50
    t.string "username", limit: 50
    t.string "phone", limit: 20
    t.text "bio"
    t.boolean "is_traveler", default: false
    t.boolean "is_phone_verified", default: false
    t.boolean "is_email_verified", default: false
    t.integer "sender_rating"
    t.integer "traveler_rating"
    t.date "DOB"
    t.string "mailing_address"
    t.string "resident_address"
    t.boolean "is_mailing_resident_same", default: false
    t.string "ID_number", limit: 25
    t.string "stripe_id"
    t.string "stripe_payment_id"
    t.string "card_brand"
    t.integer "card_last_four"
    t.integer "card_exp_month"
    t.integer "card_exp_year"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username", "phone", "ID_number"], name: "index_users_on_username_and_phone_and_ID_number", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
end
