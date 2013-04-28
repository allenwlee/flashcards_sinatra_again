helpers do

  def logged_in?
    !!current_user
  end

  def current_user
    @current_user = User.find(session[:id]) if session[:id]
  end

  def current_round
     @current_round = Round.find(session[:round]) if session[:round]
  end
end