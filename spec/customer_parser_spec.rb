# frozen_string_literal: true

require 'spec_helper'
require 'customer_parser'

RSpec.describe CustomerParser do
  context 'parse_from_string' do
    let(:stringy_customer) do
      '{"latitude": "52.986375", "user_id": 12, "name": "Christina McArdle", "longitude": "-6.043701"}'
    end

    subject { described_class.parse_from_string(stringy_customer) }

    it 'creates a customer object and assigns its values' do
      expect(subject).to be_a Customer
      expect(subject.user_id).to eql 12
      expect(subject.name).to eql 'Christina McArdle'
      expect(subject.location.latitude).to eql 52.986375
      expect(subject.location.longitude).to eql(-6.043701)
    end

    context 'with an json string with a missing location' do
      let(:stringy_customer) do
        '{"user_id": 12, "name": "Christina McArdle"}'
      end

      it 'creates a customer object and assigns its values' do
        expect(subject).to be_a Customer
        expect(subject.user_id).to eql 12
        expect(subject.name).to eql 'Christina McArdle'
        expect(subject.location).to be_nil
      end
    end

    context 'with an empty string' do
      let(:stringy_customer) { '' }

      it { is_expected.to be_nil }
    end
  end
end
