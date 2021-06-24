class PostsController < ApplicationController
  before_action :authenticate_user!, only: %i[create new]
  before_action :authorize, only: %i[create new]

  def index
    @posts = Post.all
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
