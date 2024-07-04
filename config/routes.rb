Rails.application.routes.draw do
  root 'dashboard#index'

  resources :projects, except: [:index] do
    member do
      patch :move
    end
    resources :tasks do
      member do
        patch :move
      end
    end
  end

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
end
