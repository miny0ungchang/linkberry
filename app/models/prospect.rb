class Prospect < ApplicationRecord

  PROFESSIONS = ["student", "professional"]
  VALID_EMAIL_REGEX = URI::MailTo::EMAIL_REGEXP

  validates :first_name, presence: true
  validates :email, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :profession, inclusion: { in: PROFESSIONS }, allow_blank: false

end
