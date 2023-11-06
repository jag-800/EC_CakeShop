Rails.application.routes.draw do

  namespace :admin do
    get 'orders/show'
  end
  namespace :public do
    get 'orders/new'
    get 'orders/thanks'
    get 'orders/index'
    get 'orders/show'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    get 'homes/top'
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items, except: [:destroy]
    resources :orders, only: [:index, :show, :update] do
      resources :order_detail, only: [:update]
    end
  end

  scope module: :public do
    root to: 'homes#top'
    get 'homes/about'
    
    get 'customers/mypage' => 'customers#show', as: 'mypage'
    # customers/editのようにするとdeviseのルーティングとかぶってしまうためinformationを付け加えている。
    get 'customers/information/edit' => 'customers#edit', as: 'edit_information'
    patch 'customers/information' => 'customers#update', as: 'update_information'
    get 'customers/unsubscribe' => 'customers#unsubscribe', as: 'confirm_unsubscribe'
    put 'customers/information' => 'customers#update'
    patch 'customers/withdraw' => 'customers#withdraw', as: 'withdraw_customer'
    delete 'cart_items/destroy_all' => 'cart_items#destroy_all', as: 'destroy_all_cart_items'
    post 'orders/confirm' => 'orders#confirm'
    get 'orders/thanks' => 'orders#thanks', as: 'thanks'
    
    resources :items, only: [:index, :show] do
      resources :cart_items, only: [:create, :update, :destroy]
    end
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
    resources :cart_items, only: [:index]
    resources :orders, only: [:new, :index, :create, :show]
  end

end
