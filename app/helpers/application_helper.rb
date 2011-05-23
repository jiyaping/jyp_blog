# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def ch_date(date)
    date.strftime("%Y年%y月%d日 %H:%M:%S")
  end

  def show_categories
    @categories = Category.find(:all)
    str=""
      @categories.each do |category|
        link = "/articles"+"/show_same_category/"+category.id.to_s
        str<<"<li><a href=#{link}>#{category.name}</a></li>"
      end
    str
  end

  def show_links
    str = ""
    str=<<EOF
      <li><a href="http://www.douban.com/people/jiyaping/">douban</a></li>
      <li><a href="https://github.com/jiyaping">github</a></li>
      <li><a href="http://t.sina.com.cn/jiyaping0802">t.sina</a></li>
      <li><a href="#">Qzone</a></li>
EOF
    str
  end

  def show_all_tags
    show = ""
    Tag.find(:all).each do |t|
      show<<"<a>#{t.name}</a>"
    end
    show
  end
=begin
  def show_archives
    show=""
    Article.article_date.each do |d|
      show<<"<li><a href=#{link}>#{d}</a></li>"
    show
  end
=end
end

