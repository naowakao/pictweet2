class AddItemToTweets < ActiveRecord::Migration[5.2]
  def change
    add_column :tweets, :item, :text
  end
end
