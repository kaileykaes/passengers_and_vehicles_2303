class Park
  attr_reader :name, 
              :admission_price, 
              :vehicles
  
  def initialize(name, admission_price)
    @name = name
    @admission_price = admission_price
    @vehicles = []
  end

  def add_vehicle(vehicle)
    @vehicles << vehicle
  end

  def passengers
    @vehicles.flat_map{ |vehicle| vehicle.passengers }
  end

  def revenue
    revenue = 0
    @vehicles.map{ |vehicle| revenue += @admission_price * vehicle.num_adults }
    revenue
  end

  def all_attendees
    passengers.map{ |passenger| passenger.name }.sort
  end

  def minors 
    children = passengers.find_all{ |passenger| !passenger.adult? }
    children.map{ |child| child.name }.sort
  end

  def adults 
    adults = passengers.find_all{ |passenger| passenger.adult? }
    adults.map{ |adult| adult.name }.sort
  end
end
