Rails.application.routes.draw do
  root"players#index"

  resources :players

  resources :users, only: [:create] do
  
    collection do 
      get :sign_up, action: 'new' 
    end
  end

  resources :sessions, path:'users', only: [:destroy] do
    collection do
      get :sign_in, action: 'new'
      get :sign_in, action: 'create'
    end
  end
end
