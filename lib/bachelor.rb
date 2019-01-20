def get_first_name_of_season_winner(data, season)
  data[season].each do |contestant|
     if contestant["status"] == "Winner"
       return contestant["name"].split(" ")[0]
     end
   end
end

def get_contestant_name(data, occupation)
  person = 0
  data.each do |season, contestants|
    contestants.find do |contestant|
      if contestant["occupation"] == occupation
        person = contestant["name"]
      end
    end
  end
  person
end


def count_contestants_by_hometown(data, hometown)
person = []
data.each do |season, contestants|
  contestants.each do |contestant|
    if contestant["hometown"] == hometown
      person << season
    end
  end
end
person.length
end

def get_occupation(data, hometown)
  person = 0
  data.each do |season, contestants|
    contestants.find do |contestant|
      if contestant["hometown"] == hometown
        person = contestant["occupation"]
      end
    end
  end
  person
end

def get_average_age_for_season(data, season)
contestants_ages = data[season].collect do |contestant|
  contestant["age"].to_i
end

summed_ages = contestants_ages.reduce(0) {|sum, age| sum += age }
number_of_contestants = contestants_ages.count.to_f
(summed_ages/number_of_contestants).round
end
