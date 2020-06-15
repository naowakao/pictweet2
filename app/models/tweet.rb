class Tweet < ApplicationRecord
  validates :text, presence: true
  belongs_to :user
  has_many :comments  # commentsテーブルとのアソシエーション
  has_many :likes, dependent: :destroy

  def self.search(search)
    if search
      Tweet.where('text LIKE ? OR item LIKE ?', "%#{search}%", "%#{search}%")
    else
      Tweet.all
    end
  end

end
