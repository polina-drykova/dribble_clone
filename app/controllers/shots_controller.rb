class ShotsController < ApplicationController
  before_action :set_shot, only: [:show, :edit, :update, :destroy, :like, :unlike]
    before_action :authenticate_user!, only: [:edit, :update, :destroy, :like, :unlike]
    impressionist actions: [:show], unique: [:impressionable_type, :impressionable_id, :session_hash]

  def index

  end

  def new
    @shot = current_user.shots.build
  end

  def create
    @shot = current_user.shots.build(shot_params)

    respond_to do |format|
      if @shot.save
        format.html { redirect_to @shot, notice: 'Shot was successfully created.' }
        format.json { render :show, status: :created, location: @shot }
      else
        format.html { render :new }
        format.json { render json: @shot.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_shot
    @shot = Shot.find(params[:id])
  end

  def shot_params
    params.require(:shot).permit(:title, :description, :user_shot)
  end

end
