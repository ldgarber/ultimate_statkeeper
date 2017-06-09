class TeamsController < ApplicationController 
  def index
    @teams = current_user.teams 
  end

  def create
    current_user.teams.create(team_params)
    redirect_to root_path
  end
  
  def show
    @team = Team.find(params[:id])
  end

  def edit 
  end

  def update
    @team = Team.find(params[:id])
    @team.update(team_params)
    flash[:message] = "Team saved!"
    redirect_to team_path(@team) 
  end

  def destroy
  end

  private
  def team_params
    params.require(:team).permit(
      :name, 
      players_attributes: [
        :name, 
        :height, 
        :position
      ]
    ) 
  end
end
