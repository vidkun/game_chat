json.array!(@games) do |game|
  json.extract! game, :id, :schedule, :team_1, :team_2
  json.url game_url(game, format: :json)
end
