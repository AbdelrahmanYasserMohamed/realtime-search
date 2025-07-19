require 'rails_helper'

RSpec.describe SearchTracker do
  let(:ip_address) { '127.0.0.1' }

  context 'when no previous query exists' do
    it 'creates a new SearchQuery' do
      query = SearchTracker.new(ip_address, 'First query')
      expect { query.call }.to change(SearchQuery, :count).by(1)
    end
  end

  context 'when previous query exists and current is extension' do
    it 'a query with same that same sequence as last query' do
      last_query = SearchQuery.create!(query: 'First', ip_address: ip_address, finalized: false)
      query = SearchTracker.new(ip_address, 'First extended')
      expect { query.call }.not_to change(SearchQuery, :count)
      expect(last_query.reload.query).to eq('First extended')
    end
  end

  context 'when previous query is not an extension' do
    it 'add new query which is different than the last one' do
      last_query = SearchQuery.create!(query: 'First', ip_address: ip_address, finalized: false)
      query = SearchTracker.new(ip_address, 'Different query')
      expect { query.call }.to change(SearchQuery, :count).by(1)
      expect(last_query.reload.finalized).to be true
    end
  end
end
