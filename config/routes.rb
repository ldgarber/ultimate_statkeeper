Rails.application.routes.draw do
  namespace :admin do
    # get "/stats" => "stats#stats"
    devise_scope :admin_user do
      get '/stats/:scope' => "stats#stats", as: :admin_stats
    end
  end

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations',  }
  root 'setup#index'
  get '/setup' => 'setup#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
