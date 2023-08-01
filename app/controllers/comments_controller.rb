class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_article, only: [:create] #創造時先找到文章id

  def create
    @comment = @article.comments.new(comment_params)
    # @comment.user = current_user
    # @comment.article = @article

    if comment.save
      redirect_to article_path(@article), notice: "留言成功"
    else
      render "article/show"
    end
  end

  def destroy
  end

  private
  def comment_params
    params.require(:comment).permit(:content).merge(user: current_user)
  end

  def find_article
    @article = Article.find(params[:article_id]) #找url id
  end

end
