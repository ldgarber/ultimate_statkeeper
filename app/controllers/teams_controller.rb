class TeamsController < ApplicationController 
  def index
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
