Rails.application.routes.draw do
  get 'sessions/new'
  
  root              'static_pages#home'
  
  get 'about'   =>  'static_pages#about' #nomeação de rotas (named roots) -> troca / por #
  get 'help'    =>  'static_pages#help'
  get 'contact' =>  'static_pages#contact'
  get 'signup'  =>  'users#new'
  get     'login'   =>  'sessions#new'
  post    'login'   =>  'sessions#create'
  delete  'logout'  =>  'sessions#destroy'  
  get     'edit'    =>  'users#edit'
  #rotas restful
  resources          :users
  resources          :microposts, only: [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
