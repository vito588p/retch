class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      # t.int :id
      t.string :title
      t.text :content

      t.timestamps
      # t.datetime :created_at
      # t.datetime :updated_at
    end
  end
end
