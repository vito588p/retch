Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # get "/about", controller: "pages", action: "about"

  # get "/", to: "articles#index", as: "root"
  root "articles#index"

  resource :users, except: [:show, :destroy] do #不給ＩＤ查找，不需要show 也不給刪除會員
    collection do
      get :login
      post :logining
      delete :logout
    end
  end

  resources :articles do
    resources :comments, only: [:create, :destroy], shallow: true 
  end
  # 8 個 route，7 個 action
 
  # get "/articles", to: "articles#index"
  # get "/articles/new", to: "articles#new"
  # post "/articles", to: "articles#create"

  # # # 單一頁面 慣例:id
  # # # 比對型的擺在後面
  # get "articles/:id", to: "articles#show"
  # get "articles/:id/edit", to: "articles#edit"
  # patch "articles/:id", to: "articles#update"
  # put "articles/:id", to: "articles#update"
  # delete "articles/:id", to: "articles#destroy"

  
  # get "/about", to: "pages#about"
  #get "/contact", to: "pages#contact"
end
