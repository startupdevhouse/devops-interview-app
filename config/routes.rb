Rails.application.routes.draw do
  root to: 'tickets#index'

  resources :tickets
end
