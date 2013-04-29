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
      redirect "/profile"
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
    redirect "/profile"
  else
    @error = "invalid user creation"
    erb :index
  end
end

get '/profile' do
  @user = User.find(session[:id])
  @deck = Deck.all
  
  erb :profile
end

get '/:user_id/:deck_id/round/new' do

  @deck = Deck.find(params[:deck_id])
  @round = Round.create(user_id: params[:user_id], deck_id: params[:deck_id] )
  session[:round] = @round.id 
  erb :round
end

get '/logout' do
  session.clear
  erb :index
end

get '/_navbar' do
  erb :_navbar
end


