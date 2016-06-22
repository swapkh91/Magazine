class ArticlesController < ApplicationController
  layout 'application'
  before_filter :user_access, only: [:new, :edit]

  def index
    @articles = Article.all
  end

  def new

  end

  def edit
    @article = Article.find(params[:id]) rescue nil
  end

  def update
    @article = Article.find(params[:article].delete(:id)) rescue nil

    if @article.present? && @article.update_attributes(params[:article])
      render json: {server_message: "Successfully updated Article."}
    elsif @article.present?
      render json: {server_message: "Article could not be updated."}
    else
      render json: {server_message: "Article not found."}
    end
  end

  def create
    article = Article.new(params[:article])
    article.save ? response = {server_message: "Successfully created Article."} : response = {server_message: "Article not created, please try again."}

    render json: response
  end

  def show
    @article = Article.find(params[:id]) rescue nil
    @comments = @article.comments if @article.present?
  end

  def destroy

  end
end
