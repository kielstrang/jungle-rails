class Review < ActiveRecord::Base

  belongs_to :product
  belongs_to :user

  validates :product_id, :user_id, :rating, presence: true
end
