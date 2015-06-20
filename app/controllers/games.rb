post '/games' do
  game = Game.create(player1_id: current_user.id)
  redirect to "/games/#{game.id}"
end

get '/games/index' do
  @games = Game.where(player2_id: nil).where.not(player1_id: current_user.id)
  erb :"games/_index", layout: false
end

get '/games/:id' do
  @game = Game.find(params[:id])
  erb :"games/show"
end

get '/games/:id/joined' do
  @game = Game.find(params[:id])
  response = if @game.player2_id
    @game.player2.username
  else
    "false"
  end
end

put '/games/:id/join' do
  game = Game.find(params[:id])
  if game.player2_id
    redirect to '/lobby'
  else
    game.player2_id = current_user.id
    game.save
    redirect to "/games/#{game.id}"
  end
end

get '/games/:id/state' do
  @game = Game.find(params[:id])
  @moves = @game.moves
  {game: @game, turn: @game.turn, moves: @moves}.to_json
end

post "/games/:id/click" do
  @game = Game.find(params[:id])
  @user = current_user
  if @game.users_turn == @user
    @move = @game.moves.create(box: params[:box], user_id: @user.id)
  else
  end
end