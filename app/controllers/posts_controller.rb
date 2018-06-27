class PostsController < ApplicationController
  def index
  	@post=Post.all
  end
  def new 
  	@post=Post.new
  end
  def create
  	@post=Post.create(title:params[:post][:title],content:params[:post][:content])
  	redirect_to action: 'index'
  end
end
