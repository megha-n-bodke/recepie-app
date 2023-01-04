Rails.application.routes.draw do
  
  devise_for :users
  root "recipes#index"

  resources :recipes
  resources :users   do 
    resources :recipes
  end
end
