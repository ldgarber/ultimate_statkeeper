class WelcomeController < ApplicationController 
  def index
    @team = Team.new
  end
end
