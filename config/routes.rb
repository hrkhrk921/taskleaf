Rails.application.routes.draw do
  root to: "tasks#index"
  resouces :tasks
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
