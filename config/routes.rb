Rails.application.routes.draw do
  get 'welcome/index'

  resources :articles do
  	resources :comments
  end
  	# comments is a nested resource within articles
  root 'welcome#index'

end
