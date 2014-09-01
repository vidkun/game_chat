class Comment < ActiveRecord::Base
  belongs_to :game
  default_scope { order('rank DESC') }
end
