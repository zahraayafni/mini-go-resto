require 'rails_helper'

RSpec.describe Food, type: :model do
  context 'Testing food model' do
    before(:each) do
      @food = build :food
    end

    it 'Valid food with complete variable' do
      expect(@food).to be_valid
    end

    it 'Name should be present' do
      @food.name = nil
      expect(@food).not_to be_valid
    end

    it 'Name should be longer than 3' do
      @food.name = 'ab'
      expect(@food).not_to be_valid
    end

    it 'Description should be present' do
      @food.description = nil
      expect(@food).not_to be_valid
    end

    it 'Price should be present' do
      @food.price = nil
      expect(@food).not_to be_valid
    end

    it 'Price should be integer' do
      @food.price = 'not integer'
      expect(@food).not_to be_valid
    end
  end
end
