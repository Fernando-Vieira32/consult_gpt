Rails.application.routes.draw do
  devise_for :users

  if Rails.env.development?
    get '/console', to: 'admin#console'
  end 

  root 'dashboard/home#index'

  namespace 'dashboard' do
    root 'home#index'
  end
  
end
