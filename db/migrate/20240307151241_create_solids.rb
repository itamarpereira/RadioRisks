class CreateSolids < ActiveRecord::Migration[7.1]
  def change
    create_table :solids do |t|
      t.string :gender
      t.float :dose
      t.integer :exposure
      t.float :male_expected_age
      t.float :female_expected_age
      t.float :incidence

      t.timestamps
    end
  end
end
