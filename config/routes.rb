Rails.application.routes.draw do
  devise_for :users
  
  root to: 'contact_files#index'

  resources :contact_files
  resources :contacts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
