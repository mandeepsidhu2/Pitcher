Rails.application.routes.draw do
  
  get 'posts',to:'posts#index'
  get 'posts/new',to:'posts#new'
  post 'posts',to:'posts#create'
  delete 'posts/:id',to: 'posts#destroy', as: 'posts_destroy'

  get 'users',to:'users#index'
  get 'users/sign_up',to:'users#sign_up'
  post 'users',to:'users#create'
  get 'users/sign_in',to:'users#sign_in'
  post 'users/create_session',to:'users#create_session'
  get 'users/sign_out',to:'users#sign_out',as:'users_sign_out'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
