class CreateProductPhotos < ActiveRecord::Migration[6.0]
  def change
    create_table :product_photos do |t|
      t.string :url
      t.belongs_to :product_article
    end
  end
end
