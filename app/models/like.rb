class Like < ApplicationRecord
  belongs_to :user
  belongs_to :tweet
  counter_culture :tweet
  validates :user_id, presence: true
  validates :tweet_id, presence: true
  # validates :tweet_id, presence: true, uniqueness: {scope: :tweet_id}
end
