# Write your code here!
require "pry"

def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: {
        "Alan Anderson" => {number: 0, shoe: 16, points: 22, rebounds: 12, assists: 12, steals: 3, blocks: 1, slam_dunks: 1},
        "Reggie Evans" => {number: 30, shoe: 14, points: 12, rebounds: 12, assists: 12, steals: 12, blocks: 12, slam_dunks: 7},
        "Brook Lopez" => {number: 11, shoe: 17, points: 17, rebounds: 19, assists: 10, steals: 3, blocks: 1, slam_dunks: 15},
        "Mason Plumlee" => {number: 1, shoe: 19, points: 26, rebounds: 12, assists: 6, steals: 3, blocks: 8, slam_dunks: 5},
        "Jason Terry" => {number: 31, shoe: 15, points: 19, rebounds: 2, assists: 2, steals: 4, blocks: 11, slam_dunks: 1}
      }
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: {
        "Jeff Adrien" => {number: 4, shoe: 18, points: 10, rebounds: 1, assists: 1, steals: 2, blocks: 7, slam_dunks: 2},
        "Bismak Biyombo" => {number: 0, shoe: 16, points: 12, rebounds: 4, assists: 7, steals: 7, blocks: 15, slam_dunks: 10},
        "DeSagna Diop" => {number: 2, shoe: 14, points: 24, rebounds: 12, assists: 12, steals: 4, blocks: 5, slam_dunks: 5},
        "Ben Gordon" => {number: 8, shoe: 15, points: 33, rebounds: 3, assists: 2, steals: 1, blocks: 1, slam_dunks: 0},
        "Brendan Haywood" => {number: 33, shoe: 15, points: 6, rebounds: 12, assists: 12, steals: 22, blocks: 5, slam_dunks: 12}
      }
    }
  }
end

def num_points_scored(player_name)
  game_hash.each do |location, team_info|
    team_info[:players].each do |name, statistics|
      if name == player_name
        return statistics[:points]
      end
    end
  end
end

def shoe_size(player_name)
  game_hash.each do |location, team_info|
    team_info[:players].each do |name, statistics|
      if name == player_name
        return team_info[:players][player_name][:shoe]
      end
    end
  end
end

def team_colors(team)
  game_hash.each do |location, team_info|
    if team_info[:team_name] == team
      return team_info[:colors]
    end
  end
end

def team_names
  game_hash.collect do |location, team_info|
    game_hash[location][:team_name]
  end
end

def player_numbers(team)
  numbers = []
  game_hash.collect do |location, team_info|
    if team_info[:team_name] == team
      team_info[:players].each do |name, statistics|
        numbers << statistics[:number]
      end
    end
  end
  numbers
end

def player_stats(player_name)
  game_hash.each do |location, team_info|
    team_info[:players].each do |name, statistics|
      if name == player_name
        return statistics
      end
    end
  end
end

def big_shoe_rebounds
  shoe_size = 0
  num_rebounds = 0
  game_hash.each do |location, team_info|
    team_info[:players].each do |name, statistics|
      if statistics[:shoe] > shoe_size
        shoe_size = statistics[:shoe]
        num_rebounds = statistics[:rebounds]
      end
    end
  end
  num_rebounds
end

def most_points_scored
  points_scored = 0
  mvp = ""
  game_hash.each do |location, team_info|
    team_info[:players].each do |name, statistics|
      if statistics[:points] > points_scored
        points_scored = statistics[:points]
        mvp = name
      end
    end
  end
  mvp
end

def winning_team
  home_points = 0
  away_points = 0
  game_hash.each do |location, team_info|
    team_info[:players].each do |name, statistics|
      if location == :home
        home_points += statistics[:points]
      elsif location == :away
        away_points += statistics[:points]
      end
    end
  end
  home_points > away_points ? game_hash[:home][:team_name] : game_hash[:away][:team_name]
end

def player_with_longest_name
  all_players = []
  game_hash.each do |location, team_info|
    team_info[:players].each {|name, statistics| all_players << name}
  end
  all_players.sort_by {|name| name.length}.last
end

def long_name_steals_a_ton?
  player_steals = 0
  player_name = ""
  game_hash.each do |location, team_info|
    team_info[:players].each do |name, statistics|
      if statistics[:steals] > player_steals
        player_steals = statistics[:steals]
        player_name = name
      end
    end
  end
  player_with_longest_name == player_name ? true : false
end
