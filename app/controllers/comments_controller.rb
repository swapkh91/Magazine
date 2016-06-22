class CommentsController < ApplicationController
  before_filter :find_commentable

  def new
    @comment = Comment.new
  end

  def create
    @comment = @commentable.comments.new(params[:comment])
    @comment.user_id = current_user.id

    if @comment.save
      redirect_to :back, notice: 'Your comment was posted successfully!'
    else
      redirect_to :back, notice: 'Your comment was not posted!'
    end
  end

  def destroy
    comment = Comment.find(params[:id]) rescue nil
    comment.destroy if comment
    redirect_to :back
  end

  private

  def find_commentable
    @commentable = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
    @commentable = Article.find_by_id(params[:article_id]) if params[:article_id]
  end

end