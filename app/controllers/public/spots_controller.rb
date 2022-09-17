class Public::SpotsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = Post.all
    @markers = Post.all.map do |post|
      { id: post.id, latitude: post.latitude, longitude: post.longitude, address: post.address }
    end.to_json
  end
end
