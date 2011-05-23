class Category < ActiveRecord::Base
  has_many :articles

  def time
    created_at.strftime("%Y-%m-%d %H:%M:%S")
  end
end

