airports = {
  :ZRH => "Zurich",
  :IST => "Istanbul",
  :LCY => "London",
  :LCA => "Larnaca",
  :BVA => "Paris",
  :BER => "Berlin",
  :ATH => "Athens",
  :FCO => "Rome",
  :WAW => "Warsaw",
  :MAD => "Madrid"
}

airports.each do |k,v|
  Airport.create(abbreviation: k, name: v)
end

list_of_airports = Airport.all



10000.times do
  departure_airport = list_of_airports[rand(0..airports.length - 1)].id
  arrival_airport = list_of_airports[rand(1..airports.length - 1)].id
  Flight.create(departure_date: rand(60.days).seconds.from_now,
                arrival_date: rand(60.days).seconds.from_now,
                departure_airport_id: departure_airport,
                arrival_airport_id: arrival_airport,
                flight_number: rand(1000..9999))
end