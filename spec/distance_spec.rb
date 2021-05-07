# frozen_string_literal: true

require 'spec_helper'

require 'location'

RSpec.describe Distance do
  context 'distance_to' do
    let(:office) { Location.new(53.3498, -6.2603) }
    let(:london) { Location.new(51.5074, 0.1278) }
    let(:paris) { Location.new(48.8566, 2.3522) }
    let(:new_york) { Location.new(40.7128, 74.0060) }
    let(:guiness) { Location.new(53.3420, -6.2867) }
    let(:fish_and_chips) { Location.new(53.343180, -6.269940) }

    it 'calculates the correct distances' do
      expect(Distance.between(office, london)).to be_within(0.0001).of(478.8979)
      expect(Distance.between(office, paris)).to be_within(0.0001).of(780.8826)
      expect(Distance.between(office, new_york)).to be_within(0.0001).of(5909.3285)
      expect(Distance.between(office, guiness)).to be_within(0.0001).of(1.9553)
      expect(Distance.between(office, fish_and_chips)).to be_within(0.0001).of(0.9753)
    end
  end
end
