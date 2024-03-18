Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"

  resources :products do
    get :sub_category_wise_products
  end
  resources :categories
  resources :sub_categories do
    get :category_wise_sub_categories
  end
  get 'admin/get_subcategories', to: 'admin/products#get_subcategories'
  get 
end
