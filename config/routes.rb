Rails.application.routes.draw do
  post "/users" => "users#create"
  patch "/users/:id" => "users#update"
end
