Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "posts#index"

  resources :posts, only: [:index, :new, :create, :show]
  get 'sign_in', to: 'devise/sessions#new', as: 'sign_in'
end

