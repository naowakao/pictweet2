class LikesController < ApplicationController
  def index
    @like_tweets = current_user.like_tweets
  end

  def create
    like = Like.new #Likeクラスのインスタンスを作成
    like.user_id = current_user.id #current_userのidを変数に代入
    like.tweet_id = params[:tweet_id]

    if like.save #likeが保存できているかどうかで条件分岐
      redirect_to tweets_path, success: 'いいねしました'
    else
      redirect_to tweets_path, danger: 'いいねに失敗しました'
    end
  end

  def destroy
    @like = Like.find_by(user_id: current_user.id, tweet_id: params[:tweet_id])
    @like.destroy
    redirect_to tweets_path, success: 'いいねを取り消しました'
  end
end