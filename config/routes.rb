Rails.application.routes.draw do
  resources :candidates do
    member do
      post :vote
    end

  # collection do 
  #   post :vote
  #   get :vote_list
  # end
  end

  # /candidate/:id/abd
  # /candidates/vote_list
  # post '/candidates/:id/vote', to 'candidates#vote'
end
