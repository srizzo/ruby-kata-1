# frozen_string_literal: true

require 'magazine'

describe Magazine do
  context '.read_from_csv' do
    let(:magazines) { Magazine.read_from_csv(path: File.expand_path('./fixtures/magazines.csv', File.dirname(__FILE__))) }
    it 'loads all records' do
      expect(magazines.length).to eq(6)
    end

    it 'parses published_at as date' do
      expect(magazines[0]['published_at']).to eq(Date.parse('2011-05-21'))
    end

    it 'parses authors as list' do
      expect(magazines[2]['authors']).to eq(['null-lieblich@echocat.org', 'null-walter@echocat.org'])
    end
  end
end
