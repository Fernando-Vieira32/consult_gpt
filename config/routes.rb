Rails.application.routes.draw do

  if Rails.env.development?
    get '/console', to: 'admin#console'
  end 

  namespace 'dashboard' do
    resources :home, only: %i[index]
  end
  
end
