class UsersController < ApplicationController
  def index
  	@user=User.all
  	if session[:user_id]
  		@signed_in_user=User.find(session[:user_id])
  	end
  end
  def new
  	@user=User.new
  end
  def create
  	@user=User.create(name: params[:user][:name],password: params[:user][:password],email: params[:user][:email],age: params[:user][:age])
  	session[:user_id]=@user.id
  	return redirect_to controller: 'posts', action: 'index'
  end

  def login
  end

  def create_session
  	u=User.find_by(email: params[:email],password: params[:password])
  	if u.blank?
  	return redirect_to action: 'index'
  end
  	session[:user_id]=u.id
  	return redirect_to controller: 'posts', action: 'index'
  end

  def logout
  	if !session[:user_id].blank?
      session.delete(:user_id)
    end
    return redirect_to controller: 'posts', action: 'index'
  end

end
