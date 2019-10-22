class Size < ApplicationRecord
  has_many :product_sizes
  # Task 1 - 2

  def sort_sizes(list)
    list.sort_by { |e| %w[XXS XS S M L XL XXL XS/P S/P M/P L/P XL/P].index(e) }
  end

  def sort_numeric_sizes(list)
    list.sort.reverse.sort_by(&:to_i)
  end
end
