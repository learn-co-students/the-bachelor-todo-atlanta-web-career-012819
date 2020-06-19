def get_first_name_of_season_winner(data, season)
	season_winner = nil
  data.each do |season_num, season_data|
  	if season_num == season
  		season_data.each do |contestant, attributes|
  			if contestant["status"] == "Winner"
  				season_winner = contestant["name"].split(" ")[0]
  			end
  		end
  	end
  end
  season_winner
end

def get_contestant_name(data, occupation)
  contestant_name = nil
  data.each do |season_num, season_data|
  	season_data.each do |contestant, attributes|
  		if contestant["occupation"] == occupation
  			contestant_name = contestant["name"]
  		end
  	end
  end
  contestant_name
end

def count_contestants_by_hometown(data, hometown)
  count = 0
  data.each do |season_num, season_data|
  	season_data.each do |contestant, attributes|
  		if contestant["hometown"] == hometown
  			count += 1
  		end
  	end
  end
  count
end

def get_occupation(data, hometown)
  job = nil
  data.each do |season_num, season_data|
  	season_data.each do |contestant, attributes|
  		if contestant["hometown"] == hometown
  			job = contestant["occupation"]
  			break
  		end
  	end
  end
  job
end

def get_average_age_for_season(data, season)
  total_age = 0
  num_contestants = 0
  data.each do |season_num, season_data|
  	if season_num == season
  		season_data.each do |contestant, attributes|
  			total_age += contestant["age"].to_f
  			num_contestants += 1
  		end
  	end
  end
  (total_age / num_contestants).round
end
