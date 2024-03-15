class Solid < ApplicationRecord
  GENDERS = ["masculino", "feminino"]

  validates :gender, inclusion: { in: GENDERS, message: "%{value} is not a valid gender" }
  validates :dose, inclusion: 0.1..3.99
  validates :exposure, presence: true
end
