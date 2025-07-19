class SearchTracker

  def initialize(ip_address, query)
    @ip_address = ip_address
    @query = query
  end

  def call
    last_query = SearchQuery.where(ip_address: @ip_address, finalized: false).last

    if last_query.nil? || !@query.starts_with?(last_query.query)
      last_query&.update(finalized: true)
      SearchQuery.create!(query: @query, ip_address: @ip_address, finalized: false)
    else
      last_query.update(query: @query)
    end
  end
  
end
