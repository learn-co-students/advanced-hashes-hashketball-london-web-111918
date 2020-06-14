# Write your code here!

def game_hash
  sides = {
      home: {
          team_name: 'Brooklyn Nets',
          colors: ['Black', 'White'],
          players: {
              "Alan Anderson": {
                  number: 0,
                  shoe: 16,
                  points: 22,
                  rebounds: 12,
                  assists: 12,
                  steals: 3,
                  blocks: 1,
                  slam_dunks: 1
              },
              "Reggie Evans": {
                  number: 30,
                  shoe: 14,
                  points: 12,
                  rebounds: 12,
                  assists: 12,
                  steals: 12,
                  blocks: 12,
                  slam_dunks: 7
              },
              "Brook Lopez": {
                  number: 11,
                  shoe: 17,
                  points: 17,
                  rebounds: 19,
                  assists: 10,
                  steals: 3,
                  blocks: 1,
                  slam_dunks: 15
              },
              "Mason Plumlee": {
                  number: 1,
                  shoe: 19,
                  points: 26,
                  rebounds: 12,
                  assists: 6,
                  steals: 3,
                  blocks: 8,
                  slam_dunks: 5
              },
              "Jason Terry": {
                  number: 31,
                  shoe: 15,
                  points: 19,
                  rebounds: 2,
                  assists: 2,
                  steals: 4,
                  blocks: 11,
                  slam_dunks: 1
              }
          }
      },
      away: {
          team_name: "Charlotte Hornets",
          colors: ["Turquoise", "Purple"],
          players: {
              "Jeff Adrien": {
                  number: 4,
                  shoe: 18,
                  points: 10,
                  rebounds: 1,
                  assists: 1,
                  steals: 2,
                  blocks: 7,
                  slam_dunks: 2
              },
              "Bismak Biyombo": {
                  number: 0,
                  shoe: 16,
                  points: 12,
                  rebounds: 4,
                  assists: 7,
                  steals: 7,
                  blocks: 15,
                  slam_dunks: 10
              },
              "DeSagna Diop": {
                  number: 2,
                  shoe: 14,
                  points: 24,
                  rebounds: 12,
                  assists: 12,
                  steals: 4,
                  blocks: 5,
                  slam_dunks: 5
              },
              "Ben Gordon": {
                  number: 8,
                  shoe: 15,
                  points: 33,
                  rebounds: 3,
                  assists: 2,
                  steals: 1,
                  blocks: 1,
                  slam_dunks: 0
              },
              "Brendan Haywood": {
                  number: 33,
                  shoe: 15,
                  points: 6,
                  rebounds: 12,
                  assists: 12,
                  steals: 22,
                  blocks: 5,
                  slam_dunks: 12
              }
          }
      }
  }
end

def num_points_scored(player_name)
  get_stat(player_name, "points")
end

def shoe_size(player_name)
  get_stat(player_name, "shoe")
end

def team_names
  game_hash.map do |_, value|
    value[:team_name]
  end
end

def player_numbers(team_name)
  team_players = []

  game_hash.map do |_, side|
    if side[:team_name] == team_name
      team_players = side[:players].map do |_, player|
        player[:number]
      end
    end
  end
  team_players
end

def player_stats(player_name)
  player_stats = {}

  game_hash.map do |_, side|
    if !!side[:players][player_name.to_sym]
      player_stats = side[:players][player_name.to_sym]
    end
  end

  player_stats
end

def team_colors(team_name)
  colours = []
  game_hash.map do |_, value|
    if value[:team_name] == team_name
      colours = value[:colors]
    end
  end

  colours
end

def big_shoe_rebounds
  players = game_hash[:home][:players].merge(game_hash[:away][:players])
  players.max_by{|_, v| v[:shoe]}[1][:rebounds]
end

def get_stat(player_name, stat_type)
  stat = 0
  game_hash.map do |_, value|
    if !!value[:players][player_name.to_sym]
      stat = value[:players][player_name.to_sym][stat_type.to_sym]
    end
  end

  stat
end











