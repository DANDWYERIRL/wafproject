
class HomeController < ApplicationController
  def home
	#client = Weatherman::Client.new	 
	#response= client.lookup_by_woeid('560743')
	#@location=response.location['city']
	#@temp = response.condition['temp']
	#@forecast= response.atmosphere['humidity']
	#@weather = response.condition['text']
	
  end
def myMethod
	#distance = receivedJSON[:lat]
	receivedJSON= params[:location]
	@lat = receivedJSON[:lat]
	@long =	receivedJSON[:long]
	trainTimes = RailCalc.setupLoc(@lat, @long)
	#trainTimes
	newJSON = "{\"response\" : { \"StationName\": \"#{trainTimes[0]}\", \"Lat\":\"#{trainTimes[1]}\" ,\"Long\":\"#{trainTimes[2]}\"}}"
	#, \"Times\":\"#{trainTimes[3]}\"
	#newJSON = "{\"response\" : #{trainTimes[3].to_json}}"
	render json: newJSON	
  end

end
