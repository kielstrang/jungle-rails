class User < ActiveRecord::Base
  validates :email, uniqueness: { case_sensitive: false }
  validates :email, :name, :password, presence: true
  validates_length_of :password, minimum: 8
  has_secure_password
end
