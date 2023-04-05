class Passenger
  attr_reader :name, 
              :age
  
  def initialize(passenger_details)
    @name = passenger_details['name']
    @age = passenger_details['age']
    @argument = passenger_details[:argument]
  end

  def adult?
    @age >= 18 ? true : false
  end
end