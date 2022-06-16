Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "/projects", to: "projects#index"
  # Defines the root path route ("/")
  # root "articles#index"
  post "/todos", to: "projects#create"
end
