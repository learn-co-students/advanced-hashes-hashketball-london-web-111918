 # Write your code here!
def game_hash
  game_hash = {
    :home => {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      :players => {
        "Alan Anderson" => { number: 0, shoe: 16, points: 22, rebounds: 12, assists: 12, steals: 3, blocks: 1, slam_dunks: 1 },
        "Reggie Evans" => { number: 30, shoe: 14, points: 12, rebounds: 12, assists: 12, steals: 12, blocks: 12, slam_dunks: 7 },
        "Brook Lopez" => { number: 11, shoe: 17, points: 17, rebounds: 19, assists: 10, steals: 3, blocks: 1, slam_dunks: 15 },
        "Mason Plumlee" => { number: 1, shoe: 19, points: 26, rebounds: 12, assists: 6, steals: 3, blocks: 8, slam_dunks: 5 },
        "Jason Terry" => { number: 31, shoe: 15, points: 19, rebounds: 2, assists: 2, steals: 4, blocks: 11, slam_dunks: 1 }
      }
    },
    :away => {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien" => { number: 4, shoe: 18, points: 10, rebounds: 1, assists: 1, steals: 2, blocks: 7, slam_dunks: 2 },
        "Bismak Biyombo" => { number: 0, shoe: 16, points: 12, rebounds: 4, assists: 7, steals: 7, blocks: 15, slam_dunks: 10 },
        "DeSagna Diop" => { number: 2, shoe: 14, points: 24, rebounds: 12, assists: 12, steals: 4, blocks: 5, slam_dunks: 5 },
        "Ben Gordon" => { number: 8, shoe: 15, points: 33, rebounds: 3, assists: 2, steals: 1, blocks: 1, slam_dunks: 0 },
        "Brendan Haywood" => { number: 33, shoe: 15, points: 6, rebounds: 12, assists: 12, steals: 22, blocks: 5, slam_dunks: 12 }
      }
    }
  }
end

def num_points_scored(name)
  points = 0
    game_hash.each do |team, data|
      game_hash[team][:players].each do |player_name, stats|
        if name == player_name
           points = game_hash[team][:players][name][:points]
        end
     end
   end
   points
end

def shoe_size(name)
  shoe = 0
    game_hash.each do |team, data|
      game_hash[team][:players].each do |player_name, stats|
        if name == player_name
           shoe = game_hash[team][:players][name][:shoe]
        end
      end
    end
    shoe
end

def team_colors(team_name)
  colors = []
    game_hash.each do |team, data|
      if game_hash[team][:team_name] == team_name
         colors = game_hash[team][:colors]
      end
    end
  colors
end

def team_names
  teams = []
  game_hash.each do |team, data|
    teams << game_hash[team][:team_name]
  end
  teams
end

def player_numbers(team_name)
  jersey_numbers = []
  game_hash.each do |team, data|
    game_hash[team].each do |data, stat|
      if stat == team_name
        game_hash[team][:players].each do |names, figures|
          game_hash[team][:players][names].each do |key, value|
            if key == :number
              jersey_numbers << value
            end
          end
        end
      end
    end
  end
  jersey_numbers
end

def player_stats(player_name)
  player_deits = {}
  game_hash.each do |team_type, data_hashes|
    game_hash[team_type].each do |data_hashes, stats|
      if data_hashes == :players
        game_hash[team_type][:players].each do |name, figures|
          if player_name == name
            player_deits = game_hash[team_type][:players][name]
          end
        end
      end
    end
  end
  player_deits
end

def big_shoe_rebounds
  largest_shoe = 0
  largest_shoe_player = nil
  rebounds = nil
  game_hash.each do |team_type, data_hashes|
    game_hash[team_type].each do |data_hashes, data|
      if data_hashes == :players
        game_hash[team_type][:players].each do |name, stat|
          game_hash[team_type][:players][name].each do |stat, figure|
            if stat == :shoe && figure > largest_shoe
              largest_shoe = figure
              largest_shoe_player = name
            end
          end
          if name == largest_shoe_player
            rebounds = game_hash[team_type][:players][name][:rebounds]
          end
        end
      end
    end
  end
  rebounds
end
