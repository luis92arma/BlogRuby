Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "posts#index"
  root to: "posts#new"
  root to: "posts#create"
  root to: "posts#show"
  root to: "posts#edit"
  root to: "posts#update"
  root to: "posts#destroy"
  resources :posts
end
