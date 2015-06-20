enable :sessions

before do
  pass if ["/", "/users/sign_up", "/users/login"].include?request.path
  redirect '/' unless logged_in?
end

get '/' do
  # Look in app/views/index.erb
  erb :index
end

get '/lobby' do
  @games = Game.where(player2_id: nil).where.not(player1_id: current_user.id)
  erb :lobby
end