class CommentsController < ApplicationController
  http_basic_authenticate_with name: ENV.fetch("BLOG_ADMIN_USER", "admin"),
    password: ENV.fetch("BLOG_ADMIN_PASSWORD", "change-me"), only: [:destroy]

  before_action :set_article

  def create
    @comment = @article.comments.build(comment_params)
    if @comment.save
      redirect_to article_path(@article, anchor: "comments"), notice: "Comment posted."
    else
      redirect_to article_path(@article, anchor: "comments"), alert: "Please enter your name and comment."
    end
  end

  def destroy
    @article.comments.find(params[:id]).destroy!
    redirect_to article_path(@article, anchor: "comments"), notice: "Comment deleted.", status: :see_other
  end

  private

  def set_article
    @article = Article.find(params[:article_id])
  end

  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end
