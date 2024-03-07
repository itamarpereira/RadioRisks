class Solid < ApplicationRecord
  GENDERS = ["male", "female"]

  validates :gender, inclusion: { in: GENDERS, message: "%{value} is not a valid gender" }
end
