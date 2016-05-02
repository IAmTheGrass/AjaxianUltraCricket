Rails.application.routes.draw do

resources :games

root "games#new"
get 'move' => "games#move"
end
