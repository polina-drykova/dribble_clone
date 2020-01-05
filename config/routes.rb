Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users

  resources :shots do
    resources :comments
  end
  root to: 'shots#index'

end
