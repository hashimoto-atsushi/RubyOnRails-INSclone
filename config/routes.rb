Rails.application.routes.draw do
  resources :favorites, only: [:create, :destroy]
  resources :users, only: [:new, :create, :show, :edit, :update, :destroy]
  resources :sessions, only: [:new, :create, :destroy]
  resources :blogs do
    collection do
      post :confirm
    end
  end
end
