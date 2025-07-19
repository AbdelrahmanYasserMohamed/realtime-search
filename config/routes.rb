Rails.application.routes.draw do
  root "articles#index"
  resources :articles do
    collection do
      get :search_analytics
    end
  end
end
