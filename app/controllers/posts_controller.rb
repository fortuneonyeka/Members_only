class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :new]

  def index
    @posts = Post.all
  end

  def create; end

  def new
    @post = Post.new
   end

  def show; end
end
