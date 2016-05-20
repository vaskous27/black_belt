class Borrower < ActiveRecord::Base
  has_many :lenders, through: :transactions
  has_many :transactions
  has_secure_password

   EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
end
