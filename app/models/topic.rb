class Topic < ApplicationRecord
  validates :user_id, presence: true
  validates :description, presence: true
  validates :image, presence: true

  belongs_to :user
  has_many :favorites
  mount_uploader :image, ImageUploader
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: 'user'
  has_many :comments

# トピックをいいねする
  def iine(user_id)
    favorites.create(user_id: user_id)
  end

  # トピックのいいねを解除する
  def uniine(user_id)
    favorites.find_by(user_id: user_id).destroy
  end

end
