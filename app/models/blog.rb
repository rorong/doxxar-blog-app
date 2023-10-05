class Blog < ApplicationRecord
  extend FriendlyId
  validates :title, presence: true, uniqueness: true, length: { maximum: 50 }
  validates :content, presence: true
  validates :author, presence: true
  validates :status, presence:true
  friendly_id :title, use: :slugged
  belongs_to :user
end
