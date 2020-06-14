def game_hash
{:home => {
  :team_name => "Brooklyn Nets",
  :colors => ["Black", "White"],
  :players => {
    "Alan Anderson" => {
      number: 0,
      shoe: 16,
      points: 22,
      rebounds: 12,
      assists: 12,
      steals: 3,
      blocks: 1,
      slam_dunks: 1
    },
    "Reggie Evans" => {
      number: 30,
      shoe: 14,
      points: 12,
      rebounds: 12,
      assists: 12,
      steals: 12,
      blocks: 12,
      slam_dunks: 7
    },
    "Brook Lopez" => {
      number: 11,
      shoe: 17,
      points: 17,
      rebounds: 19,
      assists: 10,
      steals: 3,
      blocks: 1,
      slam_dunks: 15
    },
    "Mason Plumlee" => {
      number: 1,
      shoe: 19,
      points: 26,
      rebounds: 12,
      assists: 6,
      steals: 3,
      blocks: 8,
      slam_dunks: 5
    },
    "Jason Terry" => {
      number: 31,
      shoe: 15,
      points: 19,
      rebounds: 2,
      assists: 2,
      steals: 4,
      blocks: 11,
      slam_dunks: 1
    }

  },

},
  :away => {
    :team_name => "Charlotte Hornets",
    :colors => ["Turquoise", "Purple"],
    :players => {
      "Jeff Adrien" => {
        number: 4,
        shoe: 18,
        points: 10,
        rebounds: 1,
        assists: 1,
        steals: 2,
        blocks: 7,
        slam_dunks: 2
      },
      "Bismak Biyombo" => {
        number: 0,
        shoe: 16,
        points: 12,
        rebounds: 4,
        assists: 7,
        steals: 7,
        blocks: 15,
        slam_dunks: 10
    },
    "DeSagna Diop" => {
      number: 2,
      shoe: 14,
      points: 24,
      rebounds: 12,
      assists: 12,
      steals: 4,
      blocks: 5,
      slam_dunks: 5,
    },
    "Ben Gordon" => {
      number: 8,
      shoe: 15,
      points: 33,
      rebounds: 3,
      assists: 2,
      steals: 1,
      blocks: 1,
      slam_dunks: 0,
    },
    "Brendan Haywood" => {
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
  new_hash = game_hash.map { |location, team_data|

    team_data.map { |attribute, data|
if attribute == :players
      data.map { |name, stat_pair|
    if name == "#{player_name}"
stat_pair[:points]
    end
          }
end
  }
}
new_hash.flatten.each do |x|
if x != nil
return x
end
end
end

def team_colors(team_name)
new = []
game_hash.map do |location, team_data|

    team_data.map do |attribute, data|
if data == "#{team_name}"
  new << game_hash[location][:colors]
  end
  end
  end
  new.flatten
end

def team_names
new = []
game_hash.map do |location, team_data|
    team_data.map do |attribute, data|
if attribute == :team_name
  new << game_hash[location][:team_name]
  end
  end
  end
  new.flatten
end

def player_numbers(team)
new = []
  game_hash.map do |location, team_data|
    if team_data.has_value?("#{team}")
      team_data.map do |attribute, data|
        if attribute == :players
          data.map do |name, facts|
            facts.map do |k, v|
              if k == :number
                new << v
            end
            end
        end
        end
        end
        end
        end
        new
  end

  def shoe_size(player_name)
new = []
  game_hash.map do |location, team_data|

    team_data.map do |attribute, data|
    if attribute == :players
      data.map do |name, stats|
  if name == "#{player_name}"
  stats.map do |k, v|
  if k == :shoe
  new << v

end
  end
  end
 end
 end
 end
 end
        new[0]
  end

  def player_stats(player_name)
new = []
  game_hash.map do |location, team_data|

    team_data.map do |attribute, data|
    if attribute == :players
      data.map do |name, stats|
  if name == "#{player_name}"
  stats.map do |k, v|
  new = stats

end
  end
  end
 end
 end
 end

        new
  end

  def big_shoe_rebounds
final = []
bigshoename = nil
bigshoesize = nil
game_hash.map do |location, team_data|

    team_data.map do |attribute, data|
    if attribute == :players
      data.map do |name, stats|
      name = "#{name}"
      stats.map do |k, v|
      if k == :shoe
        if bigshoesize == nil || bigshoesize < v
          bigshoename = name
          bigshoesize = v
          end
          end
          end
          end
          end
          end
          end
game_hash.map do |location, team_data|

    team_data.map do |attribute, data|
    if attribute == :players
      data.map do |name, stats|
      if name == bigshoename
      stats.map do |key, value|
      if key == :rebounds
      final << value
      end
      end
      end
      end
      end
      end
      end
      final[0]
      end
# Write your code here!
