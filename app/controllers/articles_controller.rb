class ArticlesController < ApplicationController
  def show
    @article = Article.find(params[:id ])
  end
  def index
    @articles = Article.all
  end
  def new
    @article = Article.new
  end
  def create
    @article = Article.new(params.require(:article).permit(:title, :description))
    if @article.save
    # redirect_to article_path(@article)
      flash[:notice] = "Article was created successfully." #to display information that help know that article was created.
      redirect_to @article
    else
      render 'new'
    end
  end
end