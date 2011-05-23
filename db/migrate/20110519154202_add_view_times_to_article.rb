class AddViewTimesToArticle < ActiveRecord::Migration
  def self.up
    add_column :articles,:view_times,:integer,:default=>0
  end

  def self.down
    remove_column :articles,:view_times
  end
end

