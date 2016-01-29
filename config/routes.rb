 Rails.application.routes.draw do
  resources :posts 
  resources :analyses

  root "pages#index"
  get '/about', to: 'pages#about'

  match '/contacts',     to: 'contacts#new',             via: 'get'
  resources "contacts", only: [:new, :create]


end
