Rails.application.routes.draw do
  resources :calls
  resources :registers
  root 'registers#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
