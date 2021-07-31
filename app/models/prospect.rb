class Prospect < ApplicationRecord

  enum professions: [:Student, :Professional]

  VALID_EMAIL_REGEX = URI::MailTo::EMAIL_REGEXP

  validates :first_name, presence: true
  validates :email, uniqueness: true, format: { with: VALID_EMAIL_REGEX }

end
