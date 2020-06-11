class AddCookToTweets < ActiveRecord::Migration[5.2]
  def change
    add_column :tweets, :cook, :text
  end
end
