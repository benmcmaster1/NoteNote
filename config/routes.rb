Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'
  resources :notes

# if the user is authenticated, put them to the notes index (calling this route 'authenticated_root')
# otherwise, it skips the block and goes to the welcome index.
# note: if you didn't have 'as: "authenticated_root", it would show an error - can't have more than 
# one root route
  authenticated :user do
    root 'notes#index', as: "authenticated_root"
  end
  

  root 'welcome#index'

  
end
