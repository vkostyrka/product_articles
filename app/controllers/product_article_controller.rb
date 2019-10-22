class ProductArticleController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    params = create_params
    product = Product.new(name: params['product_name'], sku: params['product_sku'])
    product_article = ProductArticle.new(name: params['article_name'],
                                         sku: params['article_sku'],
                                         url: params['url'],
                                         price: params['price'],
                                         product: product)
    product_photos = []
    product_sizes = []
    sizes = []

    params['photos'].each do |item|
      product_photos.push(ProductPhoto.new(url: item['url'], product_article: product_article))
    end

    params['sizes'].each do |item|
      size = Size.new(name: item['name'])
      sizes.push(size)
      product_sizes.push(ProductSize.new(product_article: product_article,
                                         size: size,
                                         sku: item['size_sku'],
                                         available: item['available']))
    end

    if product.save && product_article.save && sizes.each(&:save) &&
       product_sizes.each(&:save) && product_photos.each(&:save)
      render json: { success: true }
    else
      render json: { success: false }
    end
  end

  def add_related
    params = related_params
    article = ProductArticle.find_by(sku: params['article_sku'])
    render json: { success: false } unless article
    related_articles = params['related_sku'].map { |item| ProductArticle.find_by(sku: item) }
    if article && related_articles.all?
      related_articles.each do |item|
        article.related_articles.push(item)
      end
      render json: { success: true }
    else
      render json: { success: false }
    end
  end

  def create_params
    params.permit(:product_sku,
                  :product_name,
                  :article_sku,
                  :article_name,
                  :url,
                  :price,
                  photos: [:url],
                  sizes: %i[size_sku name available])
  end

  def related_params
    params.permit(:article_sku, related_sku: [])
  end
end
