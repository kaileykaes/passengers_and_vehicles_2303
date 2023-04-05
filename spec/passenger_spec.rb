require 'spec_helper'

RSpec.describe Passenger do
  before(:each) do
    @charlie = Passenger.new({"name" => "Charlie", "age" => 18})
    @taylor = Passenger.new({"name" => "Taylor", "age" => 12}) 
  end

  describe '#initialize' do 
    it 'exists' do
      expect(@charlie).to be_a Passenger
      expect(@taylor).to be_a Passenger
    end

    it 'has attributes' do 
      expect(@charlie.name).to eq('Charlie')
      expect(@charlie.age).to eq(18)
    end
  end

  describe '#adult?' do 
    it 'knows if adult' do 
      expect(@charlie.adult?).to be true
      expect(@taylor.adult?).to be false
    end
  end
end