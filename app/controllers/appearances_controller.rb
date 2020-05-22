class AppearancesController < ApplicationController

  def new 
    @appearance = Appearance.new
    @guests = Guest.all 
    @episodes = Episode.all
  end

  def create 
    @appearance = Appearance.create(appearance_params)
    if @appearance.valid?
      redirect_to episode_path(@appearance.episode_id)
    else 
      flash[:error] = @appearance.errors.full_messages
      redirect_to new_appearance_path
    end
  end

  private 
  def appearance_params
    params.require(:appearance).permit(
      :rating,
      :guest_id,
      :episode_id
    )
  end
end
