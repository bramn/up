Rails.application.routes.draw do
  root to: 'menu_items#index'

  resources :menu_items
  resources :folders
  resources :pages
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
