class Bar < ActiveRecord::Base
  attr_accessible :fan_intensity_rating, :fav_team_id, :gps_coords, :name, :num_of_screens, :name, :latitude, :longitude, :team_id
  has_many  :bars_games
  has_many  :games, :through => :bars_games
  belongs_to :team 

  def self.locations(team_id = nil)
    if team_id.nil?
      locations = Bar.all
    else 
      locations = Bar.find_all_by_team_id(team_id)
    end
    locations_array = []
    locations.each do |location|
      locations_array << [location.name,location.latitude,location.longitude]
    end
    locations_array
  end

end
