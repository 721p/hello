# frozen_string_literal: true

require 'spec_helper'

require 'location'

RSpec.describe Location do
  context 'when initialized with string values' do
    let(:lat) { '1.1' }
    let(:lng) { '2.2' }

    subject { described_class.new(lat, lng) }

    it 'internally converts the strings to Floats' do
      expect(subject.latitude).to eql 1.1
      expect(subject.longitude).to eql 2.2
    end

    context 'with non-numeric values' do
      let(:lat) { 'FOO' }
      let(:lng) { 'BAR' }

      it 'reverts to zeros without raising an error' do
        expect(subject.latitude).to eql 0.0
        expect(subject.longitude).to eql 0.0
      end
    end
  end

  context 'distance_to' do
    let(:office) { Location.new(53.3498, -6.2603) }
    let(:london) { Location.new(51.5074, 0.1278) }
    let(:paris) { Location.new(48.8566, 2.3522) }
    let(:new_york) { Location.new(40.7128, 74.0060) }
    let(:guiness) { Location.new(53.3420, -6.2867) }
    let(:fish_and_chips) { Location.new(53.343180, -6.269940) }

    it 'calculates the correct distances' do
      expect(office.distance_to(london)).to be_within(0.0001).of(478.8979)
      expect(office.distance_to(paris)).to be_within(0.0001).of(780.8826)
      expect(office.distance_to(new_york)).to be_within(0.0001).of(5909.3285)
      expect(office.distance_to(guiness)).to be_within(0.0001).of(1.9553)
      expect(office.distance_to(fish_and_chips)).to be_within(0.0001).of(0.9753)
    end
  end

  context 'subtraction' do
    let(:location1) { Location.new('3.0', '10.0') }
    let(:location2) { Location.new('1.0', '7.0') }

    subject { location1 - location2 }

    it 'correctly subtracts the two objects' do
      expect(subject.latitude).to eql 2.0
      expect(subject.longitude).to eql 3.0
    end

    # TODO: Add specs for invalid values (i.e invalid lat lngs)
    #
    # ...
  end
end
