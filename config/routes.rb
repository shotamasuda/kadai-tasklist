Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'tasks#index'
  resources :tasks
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  resources :users, only: [:new, :create]
  #index：ユーザ一覧表示画面
  #show：ユーザ情報表示画面
  #new：ユーザ登録画面
  #create：ユーザ作成処理（viewはない）
  
end
