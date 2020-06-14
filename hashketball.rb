require 'pry'
def game_hash
  hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => {
          :stats => {
            "Number" => 0,
            "Shoe" => 16,
            "Points" => 22,
            "Rebounds" => 12,
            "Assists" => 12,
            "Steals" => 3,
            "Blocks" => 1,
            "Slam Dunks" => 1
          }
        },
        "Reggie Evans" => {
          :stats => {
            "Number" => 30,
            "Shoe" => 14,
            "Points" => 12,
            "Rebounds" => 12,
            "Assists" => 12,
            "Steals" => 12,
            "Blocks" => 12,
            "Slam Dunks" => 7
          }
        },
        "Brook Lopez" => {
          :stats => {
            "Number" => 11,
            "Shoe" => 17,
            "Points" => 17,
            "Rebounds" => 19,
            "Assists" => 10,
            "Steals" => 3,
            "Blocks" => 1,
            "Slam Dunks" => 15
          }
        },
        "Mason Plumlee" => {
          :stats => {
            "Number" => 1,
            "Shoe" => 19,
            "Points" => 26,
            "Rebounds" => 12,
            "Assists" => 6,
            "Steals" => 3,
            "Blocks" => 8,
            "Slam Dunks" => 5
          }
        },
        "Jason Terry" => {
          :stats => {
            "Number" => 31,
            "Shoe" => 15,
            "Points" => 19,
            "Rebounds" => 2,
            "Assists" => 2,
            "Steals" => 4,
            "Blocks" => 11,
            "Slam Dunks" => 1
          }
        }
      }
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien" => {
          :stats => {
            "Number" => 4,
            "Shoe" => 18,
            "Points" => 10,
            "Rebounds" => 1,
            "Assists" => 1,
            "Steals" => 2,
            "Blocks" => 7,
            "Slam Dunks" => 2
          }
        },
        "Bismak Biyombo" => {
          :stats => {
            "Number" => 0,
            "Shoe" => 16,
            "Points" => 12,
            "Rebounds" => 4,
            "Assists" => 7,
            "Steals" => 7,
            "Blocks" => 15,
            "Slam Dunks" => 10
          }
        },
        "DeSagna Diop" => {
          :stats => {
            "Number" => 2,
            "Shoe" => 14,
            "Points" => 24,
            "Rebounds" => 12,
            "Assists" => 12,
            "Steals" => 4,
            "Blocks" => 5,
            "Slam Dunks" => 5
          }
        },
        "Ben Gordon" => {
          :stats => {
            "Number" => 8,
            "Shoe" => 15,
            "Points" => 33,
            "Rebounds" => 3,
            "Assists" => 2,
            "Steals" => 1,
            "Blocks" => 1,
            "Slam Dunks" => 0
          }
        },
        "Brendan Haywood" => {
          :stats => {
            "Number" => 33,
            "Shoe" => 15,
            "Points" => 6,
            "Rebounds" => 12,
            "Assists" => 12,
            "Steals" => 22,
            "Blocks" => 5,
            "Slam Dunks" => 12
          }
        }
      }
    }
  }
end

def good_practices
  game_hash.each do |location, team_data|
    binding.pry

    team_data.each do |attribute, data|
      binding.pry

      data.each do |data_item|
        binding.pry
      end
    end
  end
end

def num_points_scored(player_name)
  new_array = []
  game_hash.each do |location, team_name_colors_players|
    team_name_colors_players.each do |attribute, data|
      if data.include?(player_name)
        data.each do |data_item, stats|
          if data_item == player_name #data_item is a string
            stats.each do |name, value|
              new_array = value.values_at("Points")
            end #stats is an array of hashes
          end
        end
      end
    end
  end
  new_array[0]
end


def shoe_size(player_name)
  new_array = []
  game_hash.each do |location, team_name_colors_players|
    team_name_colors_players.each do |attribute, data|
      if data.include?(player_name)
        data.each do |data_item, stats|
          if data_item == player_name #data_item is a string
            stats.each do |name, value|
              new_array = value.values_at("Shoe")
            end #stats is an array of hashes
          end
        end
      end
    end
  end
  new_array[0]
  end

  def team_colors(team_name)
    new_array = []
    game_hash.each do |location, team_name_colors_players|
      team_name_colors_players.each do |attribute, data|
        if data.include?(team_name)
          new_array = team_name_colors_players[:colors]
        end
      end
    end
    new_array
end

def team_names
  new_array = []
  game_hash.each do |location, team_name_colors_players|
    team_name_colors_players.each do |attribute, data|
      new_array << team_name_colors_players[:team_name]
    end
  end
  new_array.uniq
end

def player_numbers(team_name)
  number_array = []
  game_hash.each do |location, team_name_colors_players|
    if team_name_colors_players.has_value?(team_name) #follow the correct location for the team name
      team_name_colors_players.each do |attribute, data| #first attribute is :team_name, first data is "Brooklyn Nets"
        if attribute == :players #make sure there is data to iterate through
          data.each do |data_item, stats|
            stats.each do |name, value|
                number_array << value.values_at("Number")
              end
            end
          end
        end
      end
    end
    number_array.flatten
end

def player_stats(player_name)
  stats_hash = {}
  stats_string = ""
  stats_array = []
  stats_array_new = []
  figures_new = []
  sym_new = []
  game_hash.each do |location, team_name_colors_players|
    team_name_colors_players.each do |attribute, data|
      if data.include?(player_name)
        data.each do |data_item, stats|
          if data_item == player_name #data_item is a string
            stats_array = stats.values[0].to_a #prints all stats, need to convert strings to symbols and format
            stats_string = stats_array.to_s
            stats_string = stats_string.downcase
            replacements = [['"number"', 'number'], ['"shoe"', 'shoe'], ['"points"',  'points'], ['"rebounds"', 'rebounds'], ['"assists"', 'assists'], ['"steals"', 'steals'], ['"blocks"', 'blocks'], ['"slam dunks"', 'slam_dunks']]
            replacements.each {|replacement| stats_string.gsub!(replacement[0], replacement[1])} #get rid of punctuation
              stats_string = stats_string.gsub!('[', '')
              stats_string = stats_string.chop.chop
              stats_array_new = stats_string.split('], ')
              stats_array_new = stats_array_new.each_slice(1).to_a #each item is currently a string. Need to split and convert to sym and int
              stats_array_new = stats_array_new.map {|string| string[0].split(', ', 2)}

              figures_new = stats_array_new.map do |make_into_sym, make_into_int|
                make_into_int.to_i #get a new array of the integers
                end
              sym_new = stats_array_new.map do |make_into_sym, make_into_int|
                make_into_sym.to_sym #get a new array of the symbols
              end
            end
          end
        end
      end
    end
    stats_hash = sym_new.zip(figures_new).to_h #zip together the two arrays and turn into hash
end

def big_shoe_rebounds

  #Find max shoe size
  number_array = []
  game_hash.each do |location, team_name_colors_players|
    team_name_colors_players.each do |attribute, data| #first attribute is :team_name, first data is "Brooklyn Nets"
      if attribute == :players
        data.each do |data_item, stats|
          stats.each do |name, value|
            number_array << value.values_at("Shoe")
          end
        end
      end
    end
  end
  number_array = number_array.flatten.sort{ |x, y| y<=>x} #sort in descending order
  max_shoe = number_array[0]

  #Use the max_shoe size to identify the player_name
  player_array = []
  game_hash.each do |location, team_name_colors_players|
    team_name_colors_players.each do |attribute, data|
      if attribute == :players #need to make sure this covers both locations
        data.each do |data_item, stats|
          stats.each do |name, value| #name is :stats, value is each set of stats
            value.each do |stat_type, stat_int| #stat_type look for "Shoe", stat_int look for max_shoe
              if stat_type == "Shoe" && stat_int == max_shoe 
                player_array << data_item
              end
            end
          end
        end
      end
    end
  end
  player_name = player_array[0].to_s

  #Copy the shoe_size method and update to find the no. of rebounds for the player_name
    rebound_array = []
    game_hash.each do |location, team_name_colors_players|
      team_name_colors_players.each do |attribute, data|
        if data.include?(player_name)
          data.each do |data_item, stats|
            if data_item == player_name
              stats.each do |name, value|
                rebound_array = value.values_at("Rebounds")
              end
            end
          end
        end
      end
    end
    rebounds = rebound_array[0]
end
