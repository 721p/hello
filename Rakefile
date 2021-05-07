# frozen_string_literal: true

$LOAD_PATH.unshift File.join(__dir__, 'lib')

require 'customer'
require 'location'

DUBLIN_OFFICE = Location.new(53.339428, -6.257664)

task :customers_within_100km do
  Customer.customers_within_100km(DUBLIN_OFFICE)
          .each do |customer|
            printf("%<user_id>-5s%<name>s\n", user_id: customer.user_id, name: customer.name)
          end
end
