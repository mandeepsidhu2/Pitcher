class PostsController < UsersController
  def index
  	@post=Post.all
    if !session[:user_id].blank?
      @signed_in_user=User.find(session[:user_id])
    end
  end
  def new 
  	@post=Post.new
    if session[:user_id].blank?
      redirect_to action: 'index'
    end
  end
  def create
    if !session[:user_id].blank?
        @signed_in_user=User.find(session[:user_id])
  	   @signed_in_user.posts.create(title:params[:post][:title],content:params[:post][:content])
  	   redirect_to action: 'index'
     end
  end
  def destroy 
  	@post=Post.find(params[:id])
  	@post.destroy
  	redirect_to action: 'index'
  end
end
