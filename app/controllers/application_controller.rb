class ApplicationController < ActionController::API

	def authenticate!
    username = request.headers['username'].presence
    password = request.headers['password'].presence
    if username == "username" && password == "tuskermarvel"
      true
    else
      render :json => { errors: 'User cannot be authenticated' }, status: 422
    end
  end
end
