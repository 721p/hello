# frozen_string_literal: true

class Distance
  module MathExtensions
    refine Float do
      def to_r
        self * Math::PI / 180.0
      end

      def to_sin
        Math.sin(to_r)
      end

      def to_cos
        Math.cos(to_r)
      end
    end
  end

  using MathExtensions

  EARTH_RADIUS_IN_KM = 6371.009

  # NOTE: Could have added a parameter for unit however currently falls into YAGNI
  def self.between(source_location, target_location)
    Math.acos(
      target_location.latitude.to_sin * source_location.latitude.to_sin +
      target_location.latitude.to_cos * source_location.latitude.to_cos *
      (target_location - source_location).longitude.to_cos
    ) * EARTH_RADIUS_IN_KM
  end
end
