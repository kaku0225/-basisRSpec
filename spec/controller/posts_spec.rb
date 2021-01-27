require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  it '#index' do
    get :index
    expect(response).to have_http_status(200)
    expect(response).to render_template(:index)
  end

  it 'new' do 
    get :new
    expect(response).to have_http_status(200)
    expect(response).to render_template(:new)
  end
end