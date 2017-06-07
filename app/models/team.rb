class Team < ApplicationRecord 
  has_many :team_coaches, :dependent => :destroy
  has_many :users, through: :team_coaches
  has_many :players
  accepts_nested_attributes_for :players
  has_many :games
end
