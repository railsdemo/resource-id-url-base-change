ResourceIdUrlBaseChange::Application.routes.draw do
  resources :locations, except: :destroy

  root to: "pages#home"
end
