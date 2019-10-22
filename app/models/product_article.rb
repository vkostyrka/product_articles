class ProductArticle < ApplicationRecord
  belongs_to :product
  has_many :product_sizes
  has_many :product_photos
end
