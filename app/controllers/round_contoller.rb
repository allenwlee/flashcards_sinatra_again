get "/round" do
  @deck = Deck.find(1)
  erb :round

end

get '/user/:deck_id/round/new' do
  @user = current_user
  @round = Round.create(user_id: @user.id, deck_id: params[:deck_id])
  session[:round] = @round.id
end


post '/guess' do
  @card = Card.find(params[:card][:id])
  @round = Round.find(session[:round])
  if params[:user_input].downcase == @card.answer.downcase
    puts "Successs!"
    @guess = Guess.create(attempt: 1, card_id: @card.id, round_id: session[:round])
  else
    @guess =Guess.create(attempt: 0, card_id: @card.id, round_id: session[:round])
  end
  @round.guesses << @guess
  redirect "/:user_id/:deck_id/round/#{session[:round]}"
end