module CategoryHelper
  def show_article_count(category)
    category.articles.count
  end
end

