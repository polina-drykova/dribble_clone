class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    # Finds the shot with associated shot_id
    @shot = Shot.find(params[:shot_id])
    # Creates the comment on the shot passing in params
    @comment = @shot.comments.create(comment_params)
    # assigns logged in user's ID to comment
    @comment.user_id = current_user.id if current_user
    @comment.save!

    redirect_to shot_path(@shot)
  end

  def destroy
    @shot = Shot.find(params[:shot_id])
    @comment = @shot.comments.find(params[:id])
    @comment.destroy

    redirect_to shot_path(@shot)
  end

  private

  def comment_params
    params.require(:comment).permit(:name, :response)
  end
end
