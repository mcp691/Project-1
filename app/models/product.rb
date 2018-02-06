class Product < ApplicationRecord
  has_many :orders

  def self.search(search_term)
  Product.where("name || colour || description LIKE ?", "%#{search_term}%")
  end
end
