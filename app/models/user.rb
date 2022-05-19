class User < ApplicationRecord
  before_save {email.downcase!}
  validates :email, presence: true, length: {maximum: 255}, format: {with: /@/}, uniqueness: {case_sensitive: true}
  validates :name, presence: true, length: {minimum: 2, maximum: 10}
  validates :password, presence: true, length: {minimum: 6}

  has_secure_password
end
