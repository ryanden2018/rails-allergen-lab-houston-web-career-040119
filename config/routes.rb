Rails.application.routes.draw do
  resources :ingredients, only: [:index,:show,:new,:create,:edit,:update]
  resources :users, only: [:index,:show,:destroy,:new,:edit,:update,:create]
  resources :recipes, only: [:index,:new,:create,:show,:edit,:update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
