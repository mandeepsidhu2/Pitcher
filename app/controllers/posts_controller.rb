class PostsController < UsersController
  def index
  	@post=Post.all
    if !session[:user_id].blank?
      @signed_in_user=User.find(session[:user_id])
    end
  end
  def new 
  	@post=Post.new
  end
  def create
  	@post=Post.create(title:params[:post][:title],content:params[:post][:content])
  	redirect_to action: 'index'
  end
  def destroy 
  	@post=Post.find(params[:id])
  	@post.destroy
  	redirect_to action: 'index'
  end
end
