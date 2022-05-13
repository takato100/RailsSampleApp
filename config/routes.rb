Rails.application.routes.draw do
  get 'users/show'
  get 'users/index'
  # get 'static_pages/home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'static_pages#home'

  # :provider = twitter from config/initializer/omniauth.rb?
  # http://localhost:3000/auth/twitte/callback
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/logout', to:'sessions#destroy'

  # auto "create"
  # POST /tweets to: "tweets#create" <- tweet_controller
  resources :tweets, only:[:create]

  # DELETE /tweets/:id, to: tweets#destroy
  resources :tweets, only:[:create, :destroy]

  get '/:nickname', to: 'users#show'
  get 'users/index'

end
