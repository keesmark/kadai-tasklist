class Tasklist < ApplicationRecord
  belongs_to :user
  
  validates :user_id, presence: true
  validates :status, presence: true, length: { maximum: 20 }
  validates :content, presence: true, length: { maximum: 255 }
end
