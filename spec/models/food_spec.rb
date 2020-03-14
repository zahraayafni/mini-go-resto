require 'rails_helper'

RSpec.describe Food, type: :model do
  context 'Testing food model' do
    before(:each) do
      @food = build :food
    end

    it 'Valid food with complete variable' do
      expect(@food).to be_valid
    end
  end
end
