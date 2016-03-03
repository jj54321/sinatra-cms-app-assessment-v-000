class UserController < ApplicationController

  get '/signup' do
    if !logged_in?
      erb :'user/new'
    else
      redirect to '/position'
    end
  end

  post '/signup' do
    if params[:username] == "" || params[:password] == ""
      redirect to '/signup'
    else
      @user = User.create(:username => params[:username], :password => params[:password])
      session[:user_id] = @user.id
      redirect '/position'
    end
  end

  get '/login' do
    if logged_in?
      redirect '/position'
    else
      erb :'user/login'
    end
  end

  post '/login' do
    user = User.find_by(:username => params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/position"
    else
      redirect to '/signup'
    end
  end
  
  get '/logout' do
    if logged_in?
      session.destroy
      redirect to '/login'
    else
      redirect to '/'
    end
  end



end