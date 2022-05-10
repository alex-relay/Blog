# frozen_string_literal: true

class CommentsController < ApplicationController
  def index; end

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create!(comment_params)
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy!
    redirect_to article_path(@article), status: 303
  end

  private

  def comment_params
    params.required(:comment).permit(:commenter, :body, :status)
  end
end
