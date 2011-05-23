class AddColumnToArticle < ActiveRecord::Migration
  def self.up
    add_column :articles,:category_id,:integer
  end

  def self.down
    drop_column :articles,:category_id
  end
end

