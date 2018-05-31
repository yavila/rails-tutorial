class CommentsController < ApplicationController
  http_basic_authenticate_with name: "yami", password: "demo", only: :destroy

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end
 
  def destroy
  	@article = Article.find(params[:article_id])
  	@comment = @article.comments.find(params[:id])
  	@comment.destroy 
  	# redirect back to show 
  	redirect_to article_path(@article) 
	end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end