class Person < ActiveRecord::Base
  attr_accessible :latitude, :longitude, :name
  validates_presence_of :latitude, :longitude, :name
  validates_uniqueness_of :latitude, :longitude, :name

  # Gmaps4rails gem
  acts_as_gmappable :process_geocoding => false,
                    :check_process => false,
                    :normalized_address => :location_search,
                    :lang => 'pt-BR'
  
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

end
