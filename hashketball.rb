# Write your code here!
require 'pry'
def game_hash
  game_hash = {:home => {:team_name => "Brooklyn Nets",
                          :colors => ["Black", "White"],
                          :players => {
                            "Alan Anderson" => {
                              :number => 0,
                              :shoe => 16,
                              :points => 22,
                              :rebounds => 12,
                              :assists => 12,
                              :steals => 3,
                              :blocks => 1,
                              :slam_dunks => 1},
                              "Reggie Evans" => {
                                :number => 30,
                                :shoe => 14,
                                :points => 12,
                                :rebounds => 12,
                                :assists => 12,
                                :steals => 12,
                                :blocks => 12,
                                :slam_dunks => 7},
                              "Brook Lopez" => {
                                :number => 11,
                                :shoe => 17,
                                :points => 17,
                                :rebounds => 19,
                                :assists => 10,
                                :steals => 3,
                                :blocks => 1,
                                :slam_dunks => 15},
                              "Mason Plumlee" => {
                                :number => 1,
                                :shoe => 19,
                                :points => 26,
                                :rebounds => 12,
                                :assists => 6,
                                :steals => 3,
                                :blocks => 8,
                                :slam_dunks => 5},
                                "Jason Terry" => {
                                :number => 31,
                                :shoe => 15,
                                :points => 19,
                                :rebounds => 2,
                                :assists => 2,
                                :steals => 4,
                                :blocks => 11,
                                :slam_dunks => 1}}},
               :away => {:team_name => "Charlotte Hornets",
                         :colors => ["Turquoise", "Purple"],
                        :players => {"Jeff Adrien" => {
                          :number => 4,
                          :shoe => 18,
                          :points => 10,
                          :rebounds => 1,
                          :assists => 1,
                          :steals => 2,
                          :blocks => 7,
                          :slam_dunks => 2},
                       "Bismak Biyombo" => {
                        :number => 0,
                        :shoe => 16,
                        :points => 12,
                        :rebounds => 4,
                        :assists => 7,
                        :steals => 7,
                        :blocks => 15,
                        :slam_dunks => 10},
                        "DeSagna Diop" => {
                          :number => 2,
                          :shoe => 14,
                          :points => 24,
                          :rebounds => 12,
                          :assists => 12,
                          :steals => 4,
                          :blocks => 5,
                          :slam_dunks => 5},
                          "Ben Gordon" => {
                            :number => 8,
                            :shoe => 15,
                            :points => 33,
                            :rebounds => 3,
                            :assists => 2,
                            :steals => 1,
                            :blocks => 1,
                            :slam_dunks => 0},
                            "Brendan Haywood" => {
                              :number => 33,
                              :shoe => 15,
                              :points => 6,
                              :rebounds => 12,
                              :assists => 12,
                              :steals => 22,
                              :blocks => 5,
                              :slam_dunks => 12}}}}
                            end

def num_points_scored (player_name)
  game_hash.each {|side, tdata|
  tdata.each {|tattributes, info|
    if tattributes == :players
    info.each {|player, stats|
      if player == player_name
      stats.each {|area, value|
      if area == :points

        return value
      end
        }
      end
      }
    end
  }
}
end

def shoe_size (player_name)
  game_hash.each {|side, tdata|
  tdata.each {|tattributes, info|
    if tattributes == :players
    info.each {|player, stats|
      if player == player_name
      stats.each {|area, value|
      if area == :shoe

        return value

      end
    }
  end
}
end
}
}
end

def team_colors (team)
  game_hash.each {|side, tdata|
  tdata.each {|tattributes, info|
    if game_hash[side][:team_name] == team && tattributes == :colors
      return info
    end
  }}
end

def team_names
  x = []
  game_hash.each {|side, tdata|
  tdata.each {|tattributes, info|
    if tattributes == :team_name
      x << info
    end
  }}
  return x
end

def player_numbers (tname)
  x = []
  game_hash.each {|side, tdata|
  tdata.each {|tattributes, info|
    if tattributes == :players
      info.each {|pname, stats|
      stats.each {|area, value|
        if area == :number && game_hash[side][:team_name] == tname
          x << value
        end
        }}
      end
    }}
    return x
  end

  def player_stats (pname)
    game_hash.each {|side, tdata|
    tdata.each {|tattributes, info|
      if tattributes == :players
        info.each {|p_name, stats|
          if pname == p_name
            return stats
          end
        }
      end
    }}
  end

  def big_shoe_rebounds
    l_shoe_size = 10
    l_rebounds = ""
    game_hash.each {|side, tdata|
    tdata.each {|tattributes, info|
      if tattributes == :players
        info.each {|pname, stats|
        stats.each {|area, value|
          if area == :shoe && value > l_shoe_size
            l_shoe_size = value
            l_rebounds = stats[:rebounds]
          end
      }

    }
  end
    }}
l_rebounds
  end

def most_points_scored
  most_points = 10
  most_points_player = ""
  game_hash.each {|side, tdata|
  tdata.each {|tattributes, info|
    if tattributes == :players
      info.each {|pname, stats|
      stats.each {|area, value|
        if area == :points && value > most_points
          most_points = value
          most_points_player = pname
        end
      }}
    end
  }}
  most_points_player
end

def winning_team
  home_points = 0
  away_points = 0
  game_hash.each {|side, tdata|
  tdata.each {|tattributes, info|
    if tattributes == :players
      info.each {|pname, stats|
      stats.each {|area, value|
        if side == :home && area == :points
        home_points = home_points + value
        end
        if side == :away && area == :points
          away_points = away_points + value
        end
      }}
    end
  }}
  if home_points > away_points
    return game_hash[:home][:team_name]
  else
    return game_hash[:away][:team_name]
  end
end

def player_with_longest_name
  name_length = 0
  name_length_player = ""
  game_hash.each {|side, tdata|
  tdata.each {|tattributes, info|
    if tattributes == :players
      info.each {|pname, stats|
        if pname.length > name_length
          name_length = pname.length
          name_length_player = pname
        end
      }
    end
  }}
  name_length_player
end

def long_name_steals_a_ton?
  most_steals = 10
  most_steals_player = ""
  game_hash.each {|side, tdata|
  tdata.each {|tattributes, info|
    if tattributes == :players
      info.each {|pname, stats|
      stats.each {|area, value|
        if area == :steals && value > most_steals
          most_steals = value
          most_steals_player = pname
        end
      }}
    end
  }}
  if most_steals_player == player_with_longest_name
    return true
  else
    return false
  end
end
