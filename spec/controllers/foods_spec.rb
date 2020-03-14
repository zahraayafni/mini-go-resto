require 'rails_helper'

RSpec.describe FoodsController, type: :controller do
  context 'testing food controller' do
    it 'assigns @foods' do
      food = create :food
      get :index
      expect(assigns(:foods)).to eq([food])
    end

    it 'renders the index template' do
      get :index
      expect(response).to have_http_status(200)
      expect(response).to render_template('index')
    end

    it 'renders the show template' do
      food = create :food
      get :show, params: { id: food.id }
      expect(response).to have_http_status(200)
      expect(response).to render_template :show
    end

    it 'renders the edit template' do
      food = create :food
      get :edit, params: { id: food.id }
      expect(response).to have_http_status(200)
      expect(response).to render_template :edit
    end

    it 'should create a new food' do
      params = {
        name: 'Mie Ayam',
        description: 'Mie ayam ceker',
        price: 15_000
      }
      expect(post(:create, params: { food: params })).to have_http_status(302)
      expect(response).to redirect_to Food.last
      expect(flash[:notice]).to include 'Food was successfully created'
    end

    it 'should update food info' do
      food = create :food
      params = {
        name: 'Mie Ayam',
        description: 'Mie ayam ceker',
        price: 15_000
      }

      put :update, params: { id: food.id, food: params }
      food.reload
      params.each_key do |key|
        expect(food.attributes[key.to_s]).to eq params[key]
      end
    end

    it 'should destroy food' do
      food = create :food
      expect(delete(:destroy, params: { id: food.id })).to have_http_status(302)
      expect(response).to redirect_to action: :index
      expect(flash[:notice]).to include 'Food was successfully destroyed'
    end
  end
end
