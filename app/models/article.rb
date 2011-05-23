class Article < ActiveRecord::Base
    has_many :comments
    belongs_to :category
    has_and_belongs_to_many :tags

    def self.article_date
      result = []
      dates = Article.find_by_sql("select created_at from articles")
      dates.each do |d|
        d = zh_date(d)
        result<<d unless result.include? d
      end
      result.sort!
    end

    def self.zh_date(t)
      t.created_at.strftime("%Y年%m月")
    end

    def self.search_by_date(date)
      date = date.gsub!("年","-").gsub!("月","-")
      Article.find_by_sql("select * from articles where created_at like '#{date}%'")
    end
end

