class AddLikesCountToTweets < ActiveRecord::Migration[5.2]
  class TweetUser < ApplicationRecord
    self.table_name = :tweets
  end

  def up
    _up
  rescue => e
    _down
    raise e
  end

  def down
    _down
  end

  private

  def _up
    TweetUser.reset_column_information

    add_column :tweets, :likes_count, :integer, null: false, default: 0 unless column_exists? :tweets, :likes_count
  end

  def _down
    Tweet.reset_column_information

    remove_column :tweets, :likes_count if column_exists? :tweets, :likes_count
  end
end