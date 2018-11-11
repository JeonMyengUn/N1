class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :starting_point
      t.string :destination
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
