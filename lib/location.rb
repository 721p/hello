# frozen_string_literal: true

require 'distance'

class Location
  attr_reader :latitude, :longitude

  def initialize(latitude, longitude)
    @latitude = latitude.to_f
    @longitude = longitude.to_f
  end

  def distance_to(location)
    Distance.between(location, self)
  end

  def -(other)
    Location.new(
      latitude - other.latitude,
      longitude - other.longitude
    )
  end
end
