Blog::Application.routes.draw do
 
  #devise_for :users
  
 devise_for :users , :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" } 

   get "/fb_share/auth" => "fb_share#auth"  , :method => :get , :as => :fb_auth
 
   get "/fb_share/callback" => "fb_share#callback"  , :method => :get , :as => :fb_callback
   
   get "/twitter_share/auth" => "twitter_share#auth"  , :method => :get , :as => :twitter_auth
 
   get "/twitter_share/callback" => "twitter_share#callback"  , :method => :post , :as => :twitter_callback


  #get"/omniauth_callbacks/facebook" 
  
  resources :groups do
  get "list_group_members"
  end  
 

 resources :omniauth_callbacks do
 
 get"facebook"
 get"twitter"
 get "linkedin"



 end


  resources :startups
  #get"/omniauth_callbacks/facebook"
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  
  resources :projects do
    
    #get"/omniauth_callbacks/facebook"
    get "change_launch_status", on: :member, as: :launch
    get "suggest"
    get "show_suggested"
    get "merge_request"
  end  
 

  # You can have the root of your site routed with "root"
  root :to => 'home#index'

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
