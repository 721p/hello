# frozen_string_literal: true

require 'spec_helper'

require 'customer'
require 'location'

RSpec.describe Customer do
  context 'initialization' do
    let(:user_id) { '1' }
    let(:name) { 'Lucky Maze' }
    let(:location) { Location.new(53.408405, -6.262425) }

    subject { described_class.new(user_id, name, location) }

    it 'creates an object and assigns its values' do
      expect(subject).to be_a Customer
      expect(subject.user_id).to eql user_id
      expect(subject.name).to eql name
      expect(subject.location).to eql location
    end
  end

  context 'customers_within' do
    let(:location) { Location.new(53.339428, -6.257664) }

    subject { described_class.customers_within(location, distance).count }

    context '10km' do
      let(:distance) { 10 }

      it { is_expected.to eql 0 }
    end

    context '20km' do
      let(:distance) { 20 }

      it { is_expected.to eql 1 }
    end

    context '50km' do
      let(:distance) { 50 }

      it { is_expected.to eql 8 }
    end

    context '100km' do
      let(:distance) { 100 }

      it { is_expected.to eql 16 }
    end

    context '1000km' do
      let(:distance) { 1000 }

      it { is_expected.to eql 32 }
    end
  end
end
