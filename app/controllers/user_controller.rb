get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/sign_up' do

  erb :sign_up
end

post '/login' do
  @user = User.where("email = ?", params[:user][:email]).first
  if @user
    if @user.password == params[:user][:password]
      puts "Logging in."
      session[:id] = @user.id  #maybe we can store session identification another way
      redirect "/#{@user.id}/profile"
    else
      @error = "Invalid Password"
      erb :index
    end
  else
    @error = "Invalid Email"
    erb :index
end
end

post '/sign_up' do
  @user = User.create(params[:user])
  if @user.valid?
    session[:id] = @user.id
    redirect "/#{@user.id}/profile"
  else
    @error = "invalid user creation"
    erb :index
  end
end

get '/:id/profile' do
  @user = User.find(session[:id])
  @deck = Deck.all
  
  erb :profile
end

