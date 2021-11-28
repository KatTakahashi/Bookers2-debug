Rails.application.routes.draw do
  root 'homes#top'                  #3.debug:順番変更
  get 'home/about' => 'homes#about' #3.debug:順番変更
  devise_for :users                 #3.debug:順番変更
  resources :users,only: [:show,:index,:edit,:update]
  resources :books

end #1.debug:追加