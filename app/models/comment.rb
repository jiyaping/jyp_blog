class Comment < ActiveRecord::Base
  belongs_to :article

  def time
    created_at.strftime("%Y-%m-%d %H:%M:%S")
  end
end

