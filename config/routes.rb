Rails.application.routes.draw do
  resources :users, only: [:index, :create, :show, :update, :destroy] do
    member do
      get 'see_profile'
    end
  end

  resources :products, only: [:index, :create, :show, :update, :destroy]
end
