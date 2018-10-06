Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "digitalitems/index"
  root 'digitalitems#index'
  resources :digitalitems do
    collection {get "check"}
  end
end
