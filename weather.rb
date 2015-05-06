require 'rubygems'
require 'yahoo_weatherman'


def get_location
	puts "What is your zipcode?"
	user_location = gets
	user_location.to_i
    client = Weatherman::Client.new  
    client.lookup_by_location(user_location)
end

weather = get_location
today = Time.now.strftime('%w').to_i
weather.forecasts.each do |forecast|
	day = forecast['date'].strftime('%w').to_i
	if day == today
		dayName = "Today"
	elsif day == today + 1 or day == today - 6
		dayName = "Tomorrow"
	else
		dayName = forecast['date'].strftime('%A').to_s
	end
	puts dayName + " is going to be " + forecast['text'].downcase + ' with a low of ' + forecast['low'].to_s + " and a high of " + forecast['high'].to_s
end

puts “This is a test with Git.”
