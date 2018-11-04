class FavoritesController < ApplicationController
#require "pry"

before_action :set_topic,except:[:index]

  def index
    @favorite_topics = current_user.favorite_topics
  end

  def create
    #binding.pry
    favorite = Favorite.new
    favorite.user_id = current_user.id
    favorite.topic_id = params[:topic_id]
    #いいね数を表示するための@likes
    @likes = Favorite.where(topic_id: params[:topic_id])
    if favorite.save
      redirect_to topics_path, success: 'お気に入りに登録しました'
    else
      redirect_to topics_path, danger: 'お気に入りに登録に失敗しました'
    end
    #render  json: favorite.user_id,favorite.topic_id
    #データベースからレコードを再取得する
    @topic.reload
  end
  def destroy
    #binding.pry
    #変数likeにロード
    like = Favorite.find_by(user_id: current_user.id, topic_id: params[:topic_id])
    #変数likeにロードしたオブジェクトを削除
    like.destroy
    #いいね数を表示するための@likes
    @likes = Favorite.where(topic_id: params[:topic_id])
    #データベースからレコードを再取得する
    @topic.reload
    redirect_to topics_path
  end

  private
  def set_topic
    @topic = Topic.find(params[:topic_id])
  end
end
