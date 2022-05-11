# frozen_string_literal: true

class ArticlesController < ApplicationController
  def index
    @articles = Article.all
    render json: @articles
  end

  def show
    @article = Article.find(params[:id])
    render json: @article
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      render json: @article
    else
      render json: {
        errors: [
          {
            message: 'Must be more than 10 characters'
          }
        ]
      }
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      render json: @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    head :no_content, status: :ok
  end

  private

  def article_params
    params.required(:article).permit(:title, :body, :status)
  end
end
