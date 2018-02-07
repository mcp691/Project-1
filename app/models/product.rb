class Product < ApplicationRecord
  has_many :orders

  def self.search(search_term)
    if Rails.env != "production"
      Product.where("name || colour || description LIKE ?", "%#{search_term}%")
    else
      Product.where("name || colour || description iLIKE ?", "%#{search_term}%")
    end
  end
end
