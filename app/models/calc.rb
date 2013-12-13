require 'ierail'
require 'json'
module DanStuff

	def self.setupLoc(lat1, long1)
		@lat = lat1
		@long = long1
	  	# set min as an instance variable using @
	  	@min = 9999999999
	  	# create an instance variable to hold the station name
	  	@station = nil	
		self.getStation
	end

	def self.getStation
		ir = IERail.new
	  	trainStations = ir.stations
		hash = {}
	for code in trainStations do 
		hash[code.description]=code.location
	end	
	#puts hash
		#stations = { 
  #'Pearse' => [53.343160, -6.247490],
  #'Tara Street' => [53.347070, -6.253980],
  #'Dublin Connolly' => [53.351361, -6.250067],
  #'Clontarf Road' => [53.362897, -6227767],
  #'Killester' => [53.372762, -6.205333],
  #'Harmonstown' => [53.378554, -6.192266],
  #'Raheny' => [53.381485, -6177020]
#}
	
	 hash.each do |station,coords|
	#	puts station
   # distance is = to hte result of the haversine with the following coords taken in
    distance = haversine(@lat,@long,coords[1].to_f,coords[0].to_f)
   # if distance is less than the set @min then replace @min with the new distance
    if distance < @min
      @min = distance
      @station = station#, coords[1],coords[0]
	@coords = coords[1]
	@coords2= coords[0]
    end
	#puts "#{@lat} #{@long} #{coords[1]} #{coords[0]}" 
  end
  #############################
	times = ir.station_times(@station.to_s,30)
	 timesHash = Hash.new
	#test = ir.stations
	
	for code in times do 
#timesHash[code.traincode]=code.origin,code.destination, code.train_type ,code.duein ,code.last_location
		timesHash={:traincode => code.traincode, :traintype => code.train_type, :duein => code.duein, :lastlocation => code.last_location, :direction => code.direction}
		#, :origin => code.origin, :destination => code.destination_time
	
	end
	@times = timesHash
	puts "load #{@times.to_json}"
	#puts "load #{times}"
	#puts "load #{timesHash}"
  #############################
	return @station, @coords , @coords2
	#return @times
	end

  def self.haversine(lat1, long1, lat2, long2)
    dtor = Math::PI/180
    r = 6378.14*1000
	#puts  "The values are #{lat1}, #{long1}, #{lat2}, #{long2}"
    rlat1 = lat1*dtor
 	rlong1 = long1*dtor
  	rlat2 = lat2*dtor
   	rlong2 = long2*dtor

	dlon = rlong1 - rlong2
	dlat = rlat1 - rlat2

  	a = power(Math::sin(dlat/2), 2) + Math::cos(rlat1)*Math::cos(rlat2)*power(Math::sin(dlon/2), 2)
   	c = 2*Math::atan2(Math::sqrt(a), Math::sqrt(1-a))
	d = r*c
	d
  end

  def self.power(num, pow)
    num ** pow
  end
end
ouput = DanStuff.setupLoc(53.33005285530366, -6.25946044921875)
