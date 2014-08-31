class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :author
      t.text :body
      t.belongs_to :game, index: true
      t.datetime :comment_time
      t.integer :rank
      t.string :team

      t.timestamps
    end
  end
end
