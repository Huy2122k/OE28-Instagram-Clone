Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root "static_pages#new"
    
    get "/signup", to: "users#new"
    post "/signup", to: "users#create"
    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
    
    resources :users do
      member do
        get :following, to: "follows#following"
        get :followers, to: "follows#followers"
      end
    end
    resources :relationships, only: %i(create destroy)
  end
end
