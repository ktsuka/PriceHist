Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "pricehists/index"
  root 'pricehists#index'
  resources :pricehists do
    collection {get "check"}
  end
end
