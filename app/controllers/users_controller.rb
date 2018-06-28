class UsersController < ApplicationController
  
	

  def index
  	@user=User.all
  end

  def sign_up
  	@user=User.new
  end

  def create
  	@user=User.create(name:params[:user][:name],email:params[:user][:email],password:params[:user][:password])
  	session[:user_id]=@user.id
  	redirect_to :controller=>'posts',:action=>'index'
  end


  def sign_in

  end

  def create_session
  	user=User.find_by(email:params[:email],password:params[:password])
  	if (user.blank?)
  		return redirect_to action: :sign_in
  	end

  	session[:user_id] = user.id
  	redirect_to :controller=>'posts',:action=>'index'
  end

  def sign_out
  	if !session[:user_id].blank?
  		session.delete(:user_id)
  	end
  	redirect_to :controller=>'posts',:action=>'index'
  end

end
