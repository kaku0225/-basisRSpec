require 'rails_helper'

RSpec.describe Post, type: :model do
  it '可存取post' do
    post = Post.create!
    expect(post).to eq(Post.last)
  end

  it 'post中有欄位' do
    columns = Post.column_names
    expect(columns).to include('id')
    expect(columns).to include('title')
    expect(columns).to include('content')
    expect(columns).not_to include('abc')
  end
end
