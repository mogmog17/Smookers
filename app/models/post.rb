class Post < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy

  has_one_attached :spot_image

  validates :title, presence: true
  validates :body, presence: true, length: { maximum: 250 }

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  def get_spot_image(width, height)
    unless spot_image.attached?
      file_path = Rails.root.join('app/assets/images/NoImage.jpeg')
      spot_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    spot_image.variant(resize_to_limit: [width, height]).processed
  end
end