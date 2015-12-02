Spree::Core::Engine.routes.draw do
  # Add your extension routes here
  namespace :admin do
    #get "/gcm_notification/notify_user/:id" ,:to => 'gcm_notification#notify_user' 
    resources :mobile_notification
    resources :gcm_notification do 
    	member do
    		get :notify_user
    	end
    end
  end

end
