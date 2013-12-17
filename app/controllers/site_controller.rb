class SiteController < ApplicationController

  def about
  end

  def contact
  end

  def weather
	client = Weatherman::Client.new	 
	response= client.lookup_by_woeid('560743')
	@location=response.location['city']
	@temp = response.condition['temp']
	@forecast= response.condition['forecast']
	@weather = response.condition['text']

	response2= client.lookup_by_woeid('560472')
	@loc2=response2.location['city']
	@te = response2.condition['temp']
	@fore= response2.condition['forecast']
	@weath = response2.condition['text']

	response3= client.lookup_by_woeid('560912')
	@location3=response3.location['city']
	@temp3 = response3.condition['temp']
	@forecast3= response3.condition['forecast']
	@weather3 = response3.condition['text']

	response4= client.lookup_by_woeid('562245')
	@location4=response4.location['city']
	@temp4 = response4.condition['temp']
	@forecast4= response4.condition['forecast']
	@weather4 = response4.condition['text']
  end
	
end
