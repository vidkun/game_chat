class DeleteCommentTimeFromComments < ActiveRecord::Migration
  def change
    remove_column :comments, :comment_time
  end
end
