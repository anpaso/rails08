class CommentsController < ApplicationController
#require "pry"

def new
  @comment = Comment.new
  @topic = Topic.find(params[:topic_id])
end

def create
  #binding.pry

  @comment = Comment.new(comment_params)
  @comment.user_id = current_user.id



  if @comment.save
    redirect_to topics_path, success: '投稿に成功しました'
  else
    flash.now[:danger] = "投稿に失敗しました"
    render :new
  end
end

private
def comment_params
  params.require(:comment).permit(:description, :topic_id)
end

end
