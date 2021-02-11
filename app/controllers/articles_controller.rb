class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new

  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    # @article = Article.new(params.require(:article).permit(:title, :text))
    @article = Article.new(article_params)
    # render plain: params[:article].inspect
    if @article.save
      redirect_to(@article)
    else
      render "articles/new"
    end
    end

  def update
    @article = Article.find(params[:id])

    if@article.update(article_params)
      redirect_to@article
    else
      render "articles/edit"
    end
  end

  def show
    @article = Article.find(params[:id])
  end



  private
  def article_params
    params.require(:article).permit(:title, :text)
  end
end
