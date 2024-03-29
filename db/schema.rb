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

ActiveRecord::Schema[7.1].define(version: 2024_03_07_151431) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "leukaemia", force: :cascade do |t|
    t.float "dose"
    t.integer "exposure"
    t.integer "diagnostic"
    t.float "male_expected_age"
    t.float "female_expected_age"
    t.float "incidence"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "solids", force: :cascade do |t|
    t.string "gender"
    t.float "dose"
    t.integer "exposure"
    t.float "male_expected_age"
    t.float "female_expected_age"
    t.float "incidence"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
