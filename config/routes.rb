Rails.application.routes.draw do

  resources :reviews do
    resources :comments
  end

  resources :users

  root "reviews#index"

end
