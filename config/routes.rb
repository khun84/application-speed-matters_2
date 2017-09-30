Rails.application.routes.draw do
    resources :users, :only => [:index]

    root :to => 'users#index'

    get '/?page=(:page)' => 'users#index', as: :paginate

end
