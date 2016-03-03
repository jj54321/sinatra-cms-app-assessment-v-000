class PositionController < ApplicationController

   get "/position" do
    redirect_if_not_logged_in
    @positions = Position.all
    erb :'position/index'
  end

  get '/position/new' do
    redirect_if_not_logged_in
    erb :'position/new'
  end

  post "/position/new" do
    redirect_if_not_logged_in
    @position = Position.new
    @position.instrument = params[:instrument]
    @position.status = "Open"
    @position.save
    redirect "/position"
  end

  get '/position/:id' do
    redirect_if_not_logged_in
    @position = Position.find_by_id(params[:id])
    erb :'position/show'
  end

  get '/position/:id/edit' do
    redirect_if_not_logged_in
    @position = Position.find_by_id(params[:id])
    erb :'position/edit'
  end

  post '/position/:id' do
    redirect_if_not_logged_in
    @position = Position.find_by_id(params[:id])
    if params[:close]
      @position.status = "closed"
    end
    @position.instrument = params[:instrument]
    @position.save
    redirect '/position/:id'
  end

end