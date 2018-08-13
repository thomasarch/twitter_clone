Rails.application.routes.draw do
  root 'epicenter#feed'
  # root 'epicenter#fail'

  get 'epicenter/feed'
  get 'show_user' => 'epicenter#show_user'
  get 'now_following' => 'epicenter#now_following'
  get 'unfollow' => 'epicenter#unfollow'
  get 'tweets' => 'tweets#index'
  get 'tag_tweets' => 'epicenter#tag_tweets'
  get 'nokopiri' => 'epicenter#nokopiri'
  get 'fail' => 'epicenter#fail'
  resources :tweets
  devise_for :users
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
