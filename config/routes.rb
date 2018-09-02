Rails.application.routes.draw do

  devise_for :users
  resources :tweets

  post 'tweets/follow' => 'tweets#follow'

  devise_scope :user do
    get 'users' => 'devise/sessions#index'
    get '/users/:id', to: 'devise/sessions#show', as: 'user'
  end

   root to: 'tweets#index'
  # For details on the  DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
