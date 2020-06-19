require 'pry'
def match_contestant(contestants,symbol,condition)
  contestants.each do |contestant|
    #binding.pry
    if contestant[symbol] == condition
      return contestant
    end
  end
  FALSE
end
def match_contestants(contestants,symbol,condition)
  matches = []
  contestants.each do |contestant|
    #binding.pry
    if contestant[symbol] == condition
      matches << contestant
    end
  end
  matches
end

def all_contestants(data)
  data.flat_map {|_season, contestants| contestants}
end
#ef get_first_name_of_season_winner_ugly(data, season)
#  data[season].each do |contestant|
#    #binding.pry
#    if contestant['status'] == "Winner"
#      return contestant['name'].split[0]
#    end
#  end
#  nil
#end

def get_first_name_of_season_winner(data, season)
  winner = match_contestant(data[season], 'status', 'Winner')
  winner['name'].split[0]
end

def get_contestant_name(data, occupation)
  contestant = match_contestant(all_contestants(data), 'occupation', occupation)
  contestant['name']
end

def count_contestants_by_hometown(data, hometown)
  matches = match_contestants(all_contestants(data), 'hometown', hometown)
  matches.length
end

def get_occupation(data, hometown)
  contestant = match_contestant(all_contestants(data), 'hometown', hometown)
  contestant['occupation']
end

def get_average_age_for_season(data, season)
  contestants = data[season]
  #binding.pry
  age_sum = contestants.inject(0) {|sum, i| sum + i['age'].to_f}
  (age_sum / contestants.length).round
  
end
