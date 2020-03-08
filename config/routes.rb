Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  ActiveAdmin.routes(self)

  namespace :admin, as: :admin do
    resources :articles, only: [:index, :show, :destroy, :new, :create, :update, :edit] do
      collection do
        post :batch_action
      end
    end
  end

  get 'welcome/index'

  resources :articles do
    resources :comments
  end

  root 'welcome#index'
end
