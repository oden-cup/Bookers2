Rails.application.routes.draw do
  devise_for :users, :controllers => {
 :registrations => 'users/registrations'
}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'root#top'
  get 'home/about' => "root#about"


  resources :users, only: [:index,:show, :edit,:update]
  resources :userinfos, only: [:new]
  resources :books
end
