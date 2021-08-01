Rails.application.routes.draw do
  get 'course_roadmaps/destroy'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "pages#home"

  get '/results', to: 'pages#results', as: :show_pages
  post '/connections/:id', to: 'connections#connect', as: :add_connection
  delete '/connections/:id', to: 'connections#disconnect', as: :remove_connection
  get '/results/:id', to: 'pages#showmatch', as: :show_match

  resources :connections, only: [:create, :update]
  get '/connections/requests', to: 'connections#requests', as: :requests_connections
  get '/dashboard', to: 'pages#dashboard', as: :dashboard_page
  get '/earlybird', to: 'pages#earlybird', as: :earlybird
  get '/editprofile', to: 'users#editprofile', as: :edit_profile
  patch '/dashboard', to:'users#updateprofile', as: :update_profile
  get '/dashboard/networks', to: 'pages#networks', as: :networks_page
  get '/roadmaps/suggested', to: 'roadmaps#suggested', as: :suggested_roadmap

  resources :roadmaps, only: [:create, :show, :update] do
    resources :comments, only: [:create]
    member do
      get 'builder'
    end
    collection do
      get 'builder', to: 'roadmaps#mybuilder'
      post 'builder', to: 'roadmaps#create'
    end
  end

  resources :course_roadmaps, only: [:destroy]

  get '/welcome', to: 'prospects#new', as: :welcome
  resources :prospects, only: [:new, :create]



  get '/chat/:id', to: 'chats#chat', as: :chat
  post 'chat/:id', to: 'messages#create', as: :message
end

