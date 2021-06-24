Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "posts#index"
  devise_scope :user do
    get "/sign_in" => "devise/sessions#new" # custom path to login/sign_in
    delete "/log_out" => "devise/sessions#destroy"
    get "/sign_up" => "devise/registrations#new" # custom path to sign_up/registration
  end

  resources :posts, only: [:index, :new, :create, :show]
  # Below for all other routes:
  devise_for :users
end
