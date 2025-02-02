require 'spec_helper'

RSpec.describe Vehicle do
  before(:each) do
    @vehicle = Vehicle.new('2001', 'Honda', 'Civic')   
    @charlie = Passenger.new({
      'name' => 'Charlie', 
      'age' => 18
    })  
    @jude = Passenger.new({
      'name' => 'Jude', 
      'age' => 20
    })
    @taylor = Passenger.new({
      'name' => 'Taylor', 
      'age' => 12
    })
  end

  describe '#initialize' do 
    it 'exists' do 
      expect(@vehicle).to be_a Vehicle
    end

    it 'has attributes' do 
      expect(@vehicle.year).to eq('2001')
      expect(@vehicle.make).to eq('Honda')
      expect(@vehicle.model).to eq('Civic')
    end
  end

  describe 'speed methods' do 
    it '#speeding?' do 
      expect(@vehicle.speeding?).to be false
    end

    it '#speed' do 
      @vehicle.speed
      expect(@vehicle.speeding?).to be true
    end
  end

  describe 'passenger methods' do 
    it 'starts without passengers' do 
      expect(@vehicle.passengers).to eq([])
    end

    it '#add_passenger' do 
      @vehicle.add_passenger(@charlie)
      @vehicle.add_passenger(@jude)
      @vehicle.add_passenger(@taylor)
      expect(@vehicle.passengers).to eq([@charlie, @jude, @taylor])
    end
  end

  describe 'adulthood' do 
    it '#num_adults' do 
      @vehicle.add_passenger(@charlie)
      @vehicle.add_passenger(@jude)
      @vehicle.add_passenger(@taylor)
      expect(@vehicle.num_adults).to eq(2)
    end
  end
end