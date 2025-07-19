class SearchQuery < ApplicationRecord
  scope :analytics, ->(ip) {
    where(ip_address: ip)
      .group(:query)
      .select('query, COUNT(*) as count, MAX(updated_at) as last_updated')
      .order('count DESC, last_updated DESC')
  }
end
