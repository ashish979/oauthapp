Rails.application.routes.draw do

  devise_for :users, :controllers => {:omniauth_callbacks => 'users/omniauth_callbacks', :registrations => 'users/registrations' }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
  root to: 'home#index'
end
