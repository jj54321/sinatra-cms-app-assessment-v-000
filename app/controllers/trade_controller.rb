class TradeController < ApplicationController

  get '/trade' do
    redirect_if_not_logged_in
    @trades = Trade.all
    erb :'trade/index'
  end

  get '/trade/new' do
    redirect_if_not_logged_in
    erb :'trade/new'
  end

  post '/trade/new' do
    redirect_if_not_logged_in
    Trade.create(params)
    redirect "/trade"
  end

  get '/trade/:id' do
    redirect_if_not_logged_in
    @trade = Trade.find_by_id(params[:id])
    erb :'trade/show'
  end

  get "/trade/:id/edit" do
    redirect_if_not_logged_in
    @trade = Trade.find_by_id(params[:id])
    erb :'trade/edit'
  end

  post '/trade/:id' do
    redirect_if_not_logged_in
    @trade = Trade.find_by_id(params[:id])
    @trade.entry = params[:entry]
    @trade.exit = params[:exit]
    @trade.profit_loss = params[:profit_loss]
    @trade.position_id = params[:position_id]
    @trade.save
    redirect "/trade/#{@trade.id}"
  end



end