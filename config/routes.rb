Rails.application.routes.draw do
  devise_for :users

  resources :members

  root to: "members#index"
end
