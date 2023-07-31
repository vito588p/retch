class AddUserToArticle < ActiveRecord::Migration[7.0]
  def change
    add_belongs_to :articles, :user, index: true
  end
end
