Rails.application.routes.draw do
  resources :categories
  resources :event_details
  resources :likes
  resources :follows
  resources :events
  resources :prefectures
  resources :users
  mount V1::API => '/'
end
