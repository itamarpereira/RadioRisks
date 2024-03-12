class Solid < ApplicationRecord
  GENDERS = ["male", "female"]

  validates :gender, inclusion: { in: GENDERS, message: "%{value} is not a valid gender" }
  validates :dose, inclusion: 0.1..3.99
  validates :exposure, presence: true
end
