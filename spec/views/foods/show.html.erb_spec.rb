require 'rails_helper'

RSpec.describe 'foods/show', type: :view do
  before(:each) do
    food = create :food
    @food = assign(:food, food)
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
  end
end
