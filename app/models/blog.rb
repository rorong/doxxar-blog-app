class Blog < ApplicationRecord
  extend FriendlyId

  scope :published, -> { where(is_published: true) }

  validates :title, presence: true, uniqueness: true, length: { maximum: 50 }
  validates :content, :author,:banner_image,presence: true
  friendly_id :title, use: :slugged
  belongs_to :user

  mount_uploader :banner_image, CarrierWave::Uploader::Base
end
