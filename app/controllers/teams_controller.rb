class TeamsController < ApplicationController 
  def index
    @teams = current_user.teams 
  end

  def create
    if current_user.teams.create(team_params) 
      flash[:success] = "Team created."
      redirect_to root_path
    else
      flash[:error] = "Team could not be saved. Please fill out all required fields"
      redirect_to root_path
    end
  end
  
  def show
    @team = Team.find(params[:id])
  end

  def edit 
  end

  def update
    @team = Team.find(params[:id])
    if @team.update(team_params)
      flash[:success] = "Team saved!"
    else
      flash[:error] = "Team could not be saved. Please fill out all required fields"
    end
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
