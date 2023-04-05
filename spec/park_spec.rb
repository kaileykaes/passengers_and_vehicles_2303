require 'spec_helper'

RSpec.describe Park do
  before(:each) do
    @rmnp = Park.new('Rocky Mountain National Park', 30)
    @pnf = Park.new('Pike National Forest', 50)
    @civic = Vehicle.new("2001", "Honda", "Civic")  
    @tacoma = Vehicle.new("2010", "Toyota", "Tacoma")  
    @trex = Vehicle.new('2018', 'Tesla', 'Model 3')
    @charlie = Passenger.new({
      "name" => "Charlie", 
      "age" => 18
    })  
    @jude = Passenger.new({
      "name" => "Jude", 
      "age" => 20
    })
    @taylor = Passenger.new({
      "name" => "Taylor", 
      "age" => 12
    })
    @harrison = Passenger.new({
      'name' => 'Harrison',
      'age' => 28
    })
    @adam = Passenger.new({
      'name' => 'Adam',
      'age' => 31
    })
    @trystan = Passenger.new({
      'name' => 'Trystan',
      'age' => 25
    })
    @hummingbird = Passenger.new({
      'name' => 'Hummingbird',
      'age' => 24
    })
    @colibrito = Passenger.new({
      'name' => 'Colibrito',
      'age' => 0
    })
    @trex.add_passenger(@hummingbird)
    @trex.add_passenger(@trystan)
    @trex.add_passenger(@colibrito)
    @tacoma.add_passenger(@adam)
    @tacoma.add_passenger(@harrison)
    @civic.add_passenger(@charlie)
    @civic.add_passenger(@jude)
    @civic.add_passenger(@taylor)
  end

  describe '#initialize' do 
    it 'exists' do
      expect(@rmnp).to be_a Park
      expect(@pnf).to be_a Park
    end

    it 'has attributes' do 
      expect(@rmnp.name).to eq('Rocky Mountain National Park')
      expect(@pnf.name).to eq('Pike National Forest')
      expect(@rmnp.admission_price).to eq(30)
      expect(@pnf.admission_price).to eq(50)
    end
  end

  describe 'vehicles' do 
    it 'starts without vehicles' do 
      expect(@rmnp.vehicles).to eq([])
      expect(@pnf.vehicles).to eq([])
    end

    it 'can add vehicles' do 
      @rmnp.add_vehicle(@trex)
      @rmnp.add_vehicle(@civic)
      @pnf.add_vehicle(@tacoma)
      expect(@rmnp.vehicles).to eq([@trex, @civic])
      expect(@pnf.vehicles).to eq([@tacoma])
    end
  end

  describe 'passengers' do 
    it '#passengers' do 
      @rmnp.add_vehicle(@trex)
      @rmnp.add_vehicle(@civic)
      @pnf.add_vehicle(@tacoma)
      expect(@rmnp.passengers).to eq([@hummingbird, @trystan, @colibrito, @charlie, @jude, @taylor])
      expect(@pnf.passengers).to eq([@adam, @harrison])
    end
  end

  describe '#revenue' do 
    it 'starts without revenue' do 
      expect(@rmnp.revenue).to eq(0)
      expect(@pnf.revenue).to eq(0)
    end

    it 'makes revenue' do 
      @rmnp.add_vehicle(@trex)
      @rmnp.add_vehicle(@civic)
      @pnf.add_vehicle(@tacoma)
      expect(@rmnp.revenue).to eq(60)
      expect(@pnf.revenue).to eq(50)
    end
  end
end