Rails.application.routes.draw do

  get 'gif/cool'
  get 'gif/free'
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  get 'users/new'
  get 'users/create'
  root to: 'products#index'

  resources :products, only: [:index, :show]
  resources :categories, only: [:show]
  resources :users, only: [:new, :create]

  resource :cart, only: [:show] do
    post   :add_item
    post   :remove_item
  end

  resources :orders, only: [:create, :show]

  namespace :admin do
    concern :basic_auth do
      resources :products, except: [:edit, :update, :show]
      resources :categories # Added to include category routes
      resources :sales, only: [:index, :new]
    end
    
    concerns :basic_auth
    root to: 'dashboard#show'
  end

  get '/about', to: 'about#index', as: :about

  # User Registration Routes
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  # Gif Routes
  get '/cool' => 'gif#cool'
  get '/sweet' => 'gif#sweet'

  # Session Routes
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  # Translation Routes
  post '/translate' => 'translations#translate'
  post '/change_language', to: 'application#change_language'
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
