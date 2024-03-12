class Leukaemium < ApplicationRecord
  validates :dose, inclusion: 0.1..3.99
  validates :exposure, presence: true
  validates :diagnostic, presence: true
#  validates :male_expected_age, required: true
#  validates :female_expected_age, required: true
#  validates :incidence, required: true
end
