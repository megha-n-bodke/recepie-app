Rails.application.routes.draw do
  
  devise_for :users

  root "recipes#index"
  get  'public_recipes', to: 'recipes#public_recipes'
  
  resources :foods 
  resources :recipes do
    resources :recipe_foods
    resources :foods
  end
  resources :users   do 
    resources :recipes 
    resources :foods
  end
end
