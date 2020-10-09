class Blog < ApplicationRecord
  validates :title, presence: true,
                      length: { maximum: 20 }
  validates :content, presence: true,
                      length: { maximum: 140 }
  belongs_to :user
end
