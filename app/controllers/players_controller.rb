class PlayersController < ApplicationController 
  def index 
    @players = Player.all 
  end

  def destroy
    @player = Player.find(params[:id])
    @player.destroy
    flash[:message] = "Player deleted"
    redirect_back(fallback_location: root_path)
  end
end
