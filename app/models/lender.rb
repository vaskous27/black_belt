class Lender < ActiveRecord::Base
  has_secure_password
  has_many :borrowers, through: :transactions
  has_many :transactions

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }


end
