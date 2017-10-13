class User < ActiveRecord::Base
  validates :email, uniqueness: true
  validates :name, :password, presence: true
  has_secure_password
end
