Rails.application.routes.draw do
  
  devise_for :users

  root "recipes#index"

  resources :foods 
  resources :recipes do
    resources :foods
  end
  resources :users   do 
    resources :recipes 
    resources :foods
  end
end
