class Post < ApplicationRecord
  belongs_to :user

  has_one_attached :spot_image
end
