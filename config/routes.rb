Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # get "/about", controller: "pages", action: "about"
  # get "/", to: "articles#index"
  root "articles#index"
  get "/about", to: "pages#about"
  get "/articles", to: "articles#index"
  get "/articles/new", to: "articles#new"
  post "/articles", to: "articles#create"
  # get "/contact", to: "pages#contact"
end
