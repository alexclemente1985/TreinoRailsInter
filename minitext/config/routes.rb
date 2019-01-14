Rails.application.routes.draw do
  
  
  root              'static_pages#home'
  get 'about'   =>  'static_pages#about' #nomeação de rotas (named roots) -> troca / por #
  get 'help'    =>  'static_pages#help'
  get 'contact' =>  'static_pages#contact'
  get 'signup'  =>  'users#new'
  #rotas restful
  resources          :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
