Rails.application.routes.draw do
  root "application#login"
  devise_for :users

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
