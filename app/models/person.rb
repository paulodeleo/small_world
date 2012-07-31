class Person < ActiveRecord::Base
  attr_accessible :latitude, :longitude, :name
  validates_presence_of :latitude, :longitude, :name
  validates_uniqueness_of :latitude, :longitude, :name

  # Gmaps4rails gem
  acts_as_gmappable
  
  # Geocoder gem
  geocoded_by :latlon

  def latlon
    "#{latitude}, #{longitude}"
  end

  # How markers are found
  def gmaps4rails_address
    latlon
  end

  # Marker title on the map
  def gmaps4rails_title
    name
  end

  # Get 3 closest friends
  def closest_friends
    nearbys(200)[0..2]
  end

end
