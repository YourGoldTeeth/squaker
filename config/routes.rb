Rails.application.routes.draw do

  get 'show_user' => 'epicenter#show_user'

  get 'epicenter/now_following'

  get 'feed' => 'epicenter#feed'

  get 'now_following' => 'epicenter#now_following'

  get 'unfollow' => 'epicenter/unfollow'

  resources :tweets
  devise_for :users
  
  root 'tweets#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
