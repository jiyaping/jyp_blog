module ArticlesHelper
  def view_times(article)
    article.view_times
  end

  def show_tags(article)
    show = ""
    tags = article.tags
    tags.each do |t|

      show<<"<span>#{link_to t.name,:controller=>'tags',:action=>'search_by_tag',:id=>t}</span>"
    end
    show
  end
end

