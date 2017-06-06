class Team < ApplicationRecord 
  has_many :team_coaches
  has_many :users, through: :team_coaches
  has_many :players
  has_many :games
end
