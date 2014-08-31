class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.datetime :schedule
      t.string :team_1
      t.string :team_2

      t.timestamps
    end
  end
end
