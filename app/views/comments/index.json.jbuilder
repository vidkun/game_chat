json.array!(@comments) do |comment|
  json.extract! comment, :id, :author, :body, :game_id, :comment_time, :rank, :team
  json.url comment_url(comment, format: :json)
end
