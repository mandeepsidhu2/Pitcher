Rails.application.routes.draw do
  
  get 'posts',to:'posts#index'
  get 'posts/new',to:'posts#new'
  post 'posts',to:'posts#create'
  delete 'posts/:id',to: 'posts#destroy', as: 'posts_destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'users/index'
  get 'users/new',to:'users#new'
  post 'users',to:'users#create'
  get 'users/login'
  post 'users/create_session'
  get 'users/logout', to:'users#logout',as:'user_logout'
end
