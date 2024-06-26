Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: redirect('/api-docs')

  post '/register', to: 'user#register'
  post '/login', to: 'user#login'
  put '/users/:id/update_password', to: 'user#update_password'

end
