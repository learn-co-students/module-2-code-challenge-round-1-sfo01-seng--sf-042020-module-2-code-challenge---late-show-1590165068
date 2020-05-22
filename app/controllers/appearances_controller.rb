class AppearancessController < ApplicationController

    def new
    end

    def create
        @appearance = Appearance.new
        @appearance.guest = 
        @appeearance.episode = 
        @appeeranace.save
        redirect_to episode_path()
    end
end