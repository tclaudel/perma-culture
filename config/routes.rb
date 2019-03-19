# frozen_string_literal: true

Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: "registrations" }

  resources :posts do
    resources :post_pictures, only: [:create, :destroy]
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy, :update]
    resources :users, only: [:index, :show]
  end
  get '/welcome' => "posts#index", as: :user_root

  resources :users, only: [:show, :update, :edit, :destroy, :index] do
    resources :avatars, only: [:create]
  end

  resources :articles, only: [:index, :show]
  resources :events, only: [:index]
  resources :conversations, only: [:create] do
    member do
      post :close
    end
    resources :messages, only: [:create]
  end

  root 'home#index'
end
