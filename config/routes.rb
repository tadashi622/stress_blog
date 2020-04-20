Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'
  resources :posts, except: :index do
  collection do
    get 'search'
    end
  end
  resources :users, only: :show
  post  '/like/:post_id' => 'likes#like',   as: 'like'
  delete '/like/:post_id' => 'likes#unlike', as: 'unlike'
end
