Rails.application.routes.draw do
  root 'dashboard#index'
  resources :projects, except: [:index] do
    resources :tasks
  end
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'clients/registrations'
  }
end
