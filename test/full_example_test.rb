#require_relative "test_helper"
#
#class FullExampleTest < MicroTest::Test
#
#  # This test is loosely modeled after the actual A train in New York.
#  # http://en.wikipedia.org/wiki/A_(New_York_City_Subway_service)
#  test "setup the A train" do
#
#    route = Ellington::Route.new("A Eighth Avenue Express")
#
#    line = Ellington::Line.new(
#      "IND Eighth Avenue Line",
#      "Inwood - 207th Street" => "168th Street"
#    )
#    line.stations.add Ellington::Station.new("207th Street")
#    line.stations.add Ellington::Station.new("181st Street")
#    line.stations.add Ellington::Station.new("168th Street")
#    route.add line
#
#    line = Ellington::Line.new(
#      "IND Fulton Street Line",
#      "Grant Avenue" => "Rockaway Boulevard"
#    )
#    line.stations.add Ellington::Station.new("Grant Avenue")
#    line.stations.add Ellington::Station.new("Broadway Junction")
#    line.stations.add Ellington::Station.new("Jay Street - MetroTech")
#    route.add line
#
#    context = Object.new # the wrapped context. in our case it would be a submission object
#
#    passenger = Ellington::Passenger.new(context)
#    passenger.ticket = Ellington::Ticket.new(context)
#
#    # manually acting as conductor and putting the passenger on the route
#
#    conductor = Ellington::Conductor.new(route)
#    conductor.guide(passenger)
#
#
#    if passenger.can_travel? && 
#      passenger.ticket.ok?(route, line, station) &&
#      passenger.effective?(route, line, station)
#
#      passenger.depart(route, line, station)
#    end
#  end
#
#end