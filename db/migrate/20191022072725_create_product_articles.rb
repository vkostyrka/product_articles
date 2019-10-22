class CreateProductArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :product_articles do |t|
      t.string :name
      t.string :url
      t.string :sku
      t.string :price
      t.belongs_to :product
    end
  end
end
