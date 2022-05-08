Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # TOPページにアクセスされたら「users」コントローラーへ引き渡す
  get '/', to: 'users#index'
end

