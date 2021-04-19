Rails.application.routes.draw do
  root"players#index"

  resources :players

  resources :users, only: [:create] do
  
    collection do 
      get :sign_up, action: 'new' 
    end
  end

  resources :sessions, path:'users', only: [] do
    collection do
      get :sign_in, action: 'new'
      post :sign_up, action: 'create'
      delete :sign_out, action: 'destroy'
    end
  end
end
