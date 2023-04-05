class Park
  attr_reader :name, 
              :admission_price, 
              :vehicles, 
              :revenue
  
  def initialize(name, admission_price)
    @name = name
    @admission_price = admission_price
    @vehicles = []
    @revenue = 0
  end

  def add_vehicle(vehicle)
    @vehicles << vehicle
  end

  def passengers
    @vehicles.map {|vehicle| vehicle.passengers}.flatten!
  end

  def revenue
    @vehicles.map {|vehicle| @revenue += @admission_price * vehicle.num_adults}
    @revenue
  end

  def all_attendees
    passengers.map {|passenger| passenger.name}.sort
  end

  def minors 
    children = passengers.find_all {|passenger| passenger.adult? != true}
    children.map {|child| child.name}.sort
  end
end
