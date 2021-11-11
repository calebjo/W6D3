Rails.application.routes.draw do
  resources :users, only: [:index, :create, :show, :destroy, :update]
  
  resources :users do
    resources :artworks, only: [:index]
  end
  
  resources :likes, only: [:create, :destroy]
  resources :comments, only: [:index, :create, :destroy]
  resources :artworks, only: [:create, :show, :destroy, :update]
  resources :artwork_shares, only: [:index, :create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
