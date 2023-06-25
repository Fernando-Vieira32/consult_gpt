Rails.application.routes.draw do
  if Rails.env.development?
    get '/console', to: 'admin#console'
  end 
end
