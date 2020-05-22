class EpisodesController < ApplicationController

  def index
    @episodes = Episode.all
  end

  def edit
    @episode = Episode.find(param[id])
  end
  
end
