class User < ActiveRecord::Base
  validates :email, uniqueness: { case_sensitive: false }
  validates :email, :name, :password, presence: true
  validates_length_of :password, minimum: 8
  has_secure_password

  def User.authenticate_with_credentials(email, password)
    user = User.where('lower(email) = ?', email.strip.downcase).first
    if user && user.authenticate(password) then user end
  end
end
