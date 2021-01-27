require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  before(:all) do
    @post_1 = Post.create(title: 'title_1', content: 'content_1')
    @post_2 = Post.create(title: 'title_2', content: 'content_2')
  end

  it '#index' do
    get :index
    expect(response).to have_http_status(200)
    expect(response).to render_template(:index)
  end

  it '#new' do 
    get :new
    expect(response).to have_http_status(200)
    expect(response).to render_template(:new)
  end

  it '#edit' do
    get :edit, params: { id: @post_1.id }
    expect(response).to have_http_status(200)
    expect(response).to render_template(:edit)
  end

  describe '#create' do
    before(:all) do
      @post_params = {post: {title: 'title', content: 'content'}}
    end
    
    it 'create record' do
      expect{ post :create, params: @post_params }.to change{Post.all.size}.by(1)
    end
  end
end