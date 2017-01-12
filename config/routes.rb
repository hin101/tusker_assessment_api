Rails.application.routes.draw do
  get '/' => 'api_prospects#index'
  get '/packages' => 'api_prospects#packages'
  post '/packages_city' => 'api_prospects#packagesCity'
end
