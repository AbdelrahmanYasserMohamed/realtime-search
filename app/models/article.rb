class Article < ApplicationRecord
 scope :search_by_title, ->(query) {where("title ILIKE ?", "%#{query}%") if query.present?}
end
