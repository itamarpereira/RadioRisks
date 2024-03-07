class CreateLeukaemia < ActiveRecord::Migration[7.1]
  def change
    create_table :leukaemia do |t|
      t.float :dose
      t.integer :exposure
      t.integer :diagnostic
      t.float :male_expected_age
      t.float :female_expected_age
      t.float :incidence

      t.timestamps
    end
  end
end
