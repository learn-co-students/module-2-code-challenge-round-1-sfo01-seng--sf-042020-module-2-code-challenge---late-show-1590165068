class GuestsController < ApplicationController

  def index
    @guests = Guest.all
  end

  def edit
    @guest = Guest.find(param[:id])
  end

end
