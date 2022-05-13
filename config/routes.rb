Rails.application.routes.draw do
  # get 'static_pages/home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'static_pages#home'

  # :provider = twitter from config/initializer/omniauth.rb?
  # http://localhost:3000/auth/twitte/callback
  get '/auth/:provider/callback', to: 'sessions#create'
  get '/logout', to:'sessions#destroy'

end
