Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "investments#index"
  # Routes for the Investment resource:
  # CREATE
  get "/investments/new", :controller => "investments", :action => "new"
  post "/create_investment", :controller => "investments", :action => "create"

  # READ
  get "/investments", :controller => "investments", :action => "index"
  get "/investments/:id", :controller => "investments", :action => "show"

  # UPDATE
  get "/investments/:id/edit", :controller => "investments", :action => "edit"
  post "/update_investment/:id", :controller => "investments", :action => "update"

  # DELETE
  get "/delete_investment/:id", :controller => "investments", :action => "destroy"
  #------------------------------

  devise_for :users
  # Routes for the User resource:
  # READ
  get "/users", :controller => "users", :action => "index"
  get "/users/:id", :controller => "users", :action => "show"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
