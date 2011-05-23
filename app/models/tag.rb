class Tag < ActiveRecord::Base
      has_and_belongs_to_many :articles

  def self.get_tag_or_new_it(t)
    tag = find_by_name(t)
    if !tag
      tag = create(:name=>t)
    end
    tag
  end
end

