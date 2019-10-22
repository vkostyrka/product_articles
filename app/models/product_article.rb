class ProductArticle < ApplicationRecord
  belongs_to :product
  has_many :product_sizes
  has_many :product_photos
  has_many :related_articles, class_name: 'ProductArticle', foreign_key: 'parent_article_id'
end
