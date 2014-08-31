class ChangeRankInComments < ActiveRecord::Migration
  def change
    change_column :comments, :rank, :integer, default: 0
  end
end
