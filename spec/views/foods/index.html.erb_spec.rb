require 'rails_helper'

RSpec.describe 'foods/index', type: :view do
  before(:each) do
    assign(:foods, [
             Food.create!(
               name: 'Name',
               description: 'Description',
               price: 100
             ),
             Food.create!(
               name: 'Name',
               description: 'Description',
               price: 100
             )
           ])
  end

  it 'renders a list of foods' do
    render
    assert_select 'tr>td', text: 'Name'.to_s, count: 2
    assert_select 'tr>td', text: 'Description'.to_s, count: 2
    assert_select 'tr>td', text: 100.to_s, count: 2
  end
end
