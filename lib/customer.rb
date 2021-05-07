# frozen_string_literal: true

require 'customer_parser'

class Customer
  attr_accessor :user_id, :name, :location

  DATABASE = 'data/customers.txt'

  def self.customers_within_100km(location, sort_by = :user_id)
    customers_within(location, 100, sort_by)
  end

  def self.customers_within(location, distance, sort_by = :user_id)
    File.open(DATABASE)
        .map { |line| CustomerParser.parse_from_string(line) }
        .select { |customer| customer.location.distance_to(location) < distance }
        .sort_by(&sort_by)
  end

  def initialize(user_id, name, location)
    @user_id = user_id
    @name = name
    @location = location
  end
end
