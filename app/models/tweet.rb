class Tweet < ApplicationRecord
  validates :text, presence: true
  belongs_to :user
  has_many :comments  # commentsテーブルとのアソシエーション
  has_many :likes, dependent: :destroy
  has_many :iine_users, through: :likes, source: :user

  def self.search(search)
    if search
      Tweet.where('text LIKE ? OR item LIKE ?', "%#{search}%", "%#{search}%")
    else
      Tweet.all
    end
  end

  def iine?(user)
    iine_users.include?(user)
  end

  # マイクロポストをいいねする
  def iine(user)
    likes.create(user_id: user.id)
  end

  # マイクロポストのいいねを解除する（ネーミングセンスに対するクレームは受け付けません）
  def uniine(user)
    likes.find_by(user_id: user.id).destroy
  end



end
