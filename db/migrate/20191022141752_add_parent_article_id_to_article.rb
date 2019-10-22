class AddParentArticleIdToArticle < ActiveRecord::Migration[6.0]
  def change
    add_column :product_articles, :parent_article_id, :integer
  end
end
