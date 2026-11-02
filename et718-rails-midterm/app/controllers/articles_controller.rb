class ArticlesController < ApplicationController
  http_basic_authenticate_with name: ENV.fetch("BLOG_ADMIN_USER", "admin"),
    password: ENV.fetch("BLOG_ADMIN_PASSWORD", "change-me"),
    except: [:index, :show]

  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.order(created_at: :desc)
  end

  def show; end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article, notice: "Article created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @article.update(article_params)
      redirect_to @article, notice: "Article updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article.destroy!
    redirect_to articles_path, notice: "Article deleted.", status: :see_other
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :body)
  end
end
