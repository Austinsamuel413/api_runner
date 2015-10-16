class Api::PostsController < ApplicationController
  protect_from_forgery with: :null_session

  before_action do
    request.format = :json
  end

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
    if @post.save
      render status: 201, json: @post
    else
      render status: 422, json: @post.errors
    end
  end

  def show
    @post = Post.find params[:id]
    if @post.save
      render status: 201, json: @post
    else
      render status: 422, json: @post.errors
    end
  end

def create
  @post = Post.new params.require(:post).permit(:title, :body)

if @post.save
  render status: 201, json: @post
else
  render status: 422, json: @post.errors
end
end

def update
  @post = Post.find params[:id]
  if @post.update params.require(:post).permit(:title, :body)
    render status: 201, json: @post
  else
    render status: 422, json: @post.errors
end
end

def destroy
  @post = post.find params[:id]
  @post.destroy
  render status: 201, json: @post
end
end
