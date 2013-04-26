get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/sign_up' do

  erb :sign_up
end


post '/login' do
  puts params
  p params[:user][:email]
  p params[:user][:password_hash]
  @user = User.where("email = ?", params[:user][:email]).first
  if @user.password == params[:user][:password]
    puts "Logging in."
    session[:id] = @user.id  #maybe we can store session identification another way
    erb :member_page
  else
    @valid_user = false  # might change way to display errors for vissssews
    erb :index
  end
end
