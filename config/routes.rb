Rails.application.routes.draw do
	devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'books#top'
  get "home/about" => 'books#about'
  resources :users, only: [:show, :index, :edit, :update] do
  	member do
  		get :followings, :followers
  	end
  end
  resources :books, only: [:new, :index, :create, :show, :edit, :destroy, :update ]
  resources :relationships, only: [:create, :destroy]
end