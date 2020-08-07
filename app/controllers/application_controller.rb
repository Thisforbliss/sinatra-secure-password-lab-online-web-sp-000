require "./config/environment"
require "./app/models/user"
class ApplicationController < Sinatra::Base

  configure do
    set :views, "app/views"
    enable :sessions
    set :session_secret, "password_security"
  end

  get "/" do
    erb :index
  end

  get "/signup" do
    erb :signup
  end

  post "/signup" do
    #user = User.create(:username => params[:username], :password => params[password])
    if params[:username] == ''
      redirect '/failure'
    elsif params[:password] == ''
      redirect 'failure'
    elsif
     redirect 'login'
    end
  end

  get '/account' do
    @user = User.find(session[:user_id])
    erb :account
  end


  get "/login" do
    
    erb :login
  end

  post "/login" do
    
    ##your code here
<<<<<<< HEAD
    # @user = User.find_by(username => params[:username])
    # #binding.pry
    # if params[:username] == ''
    #   redirect '/failure'
    # elsif params[:password] == ''
    #   redirect '/failure'
    # elsif @user && @user.authenicate(params[:password])
    # binding.pry
    # session[:user_id] = @user.id
    #   redirect '/account'
    # end 
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect to "/account"
    else
      redirect to "/failure"
    end
=======
    @user = User.find_by(username: params[:username])
    #binding.pry
    if params[:username] == ''
      redirect '/failure'
    elsif params[:password] == ''
      redirect '/failure'
    elsif @user && @user.authenicate(params[:password])
    binding.pry
    session[:user_id] = @user.id
      redirect '/account'
    end 
    # @user = User.find_by(username: params[:username])
    # if @user && @user.authenticate(params[:password])
    #   session[:user_id] = @user.id
    #   redirect to "/account"
    # else
    #   redirect to "/failure"
    # end
>>>>>>> b90bd1a0732b13e28fb9d840e72570ca00480498

  end

  get "/failure" do
    erb :failure
  end

  get "/logout" do
    session.clear
    redirect "/"
  end

  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end
  end

end
