class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.author = current_user.email
    @comment.post_id = params[:post_id]
    if (@comment.save)
      flash[:success] = t("comment_created") + '!'
      redirect_to '/posts/' + params[:post_id].to_s
    else
      redirect_to '/posts/' + params[:post_id].to_s
    end
  end

  def destroy
    @comment = Comment.find(params[:comment_id])
    @comment.destroy
    flash[:success] = t("comment_deleted") + '!'

    redirect_to '/posts/' + params[:post_id].to_s
  end

  private def comment_params
    params.require(:comment).permit(:body)
  end
end
