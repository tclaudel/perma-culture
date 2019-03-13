# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }

  resources :posts do
    resources :post_pictures, only: [:create]
  end
  get '/welcome' => 'posts#index', as: :user_root

  resources :users, only: %i[show update edit destroy index] do
    resources :avatars, only: [:create]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
end
