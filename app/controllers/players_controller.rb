class PlayersController < ApplicationController 
  def index 
    if params[:team_id]
      @players = Team.find(params[:team_id]).players
    else
      @players = Player.all 
    end
  end

  def destroy
    @player = Player.find(params[:id])
    @player.destroy
    flash[:message] = "Player deleted"
    redirect_back(fallback_location: root_path)
  end
end
