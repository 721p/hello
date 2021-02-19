# frozen_string_literal: true

require 'json'
require 'location'

class CustomerParser
  def self.parse_from_string(json_string)
    return if json_string.nil? || json_string == '' # NOTE: No ActiveSupport .present?

    attributes = JSON.parse(json_string)
    location = if attributes.slice('latitude', 'longitude').size == 2
                 Location.new(attributes['latitude'], attributes['longitude'])
               end

    Customer.new(attributes['user_id'], attributes['name'], location)
  end
end
