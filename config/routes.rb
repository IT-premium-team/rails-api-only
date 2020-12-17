Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :spells, only: [:index, :create, :destroy]
    end
  end
end
