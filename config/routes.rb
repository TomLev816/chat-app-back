Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users
      resources :rooms, only: [:index, :new, :create]
      resources :messages, only: [:create]
      mount ActionCable.server => '/cable'
    end
  end
end
