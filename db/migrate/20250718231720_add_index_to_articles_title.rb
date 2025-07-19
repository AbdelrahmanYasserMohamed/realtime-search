class AddIndexToArticlesTitle < ActiveRecord::Migration[7.0]
  def change
    add_index :articles, :title
    add_index :search_queries, :ip_address
  end
end
