post '/users/sign_up' do
  @user = User.create(params[:user])
  # @user = User.create(username: params[:username],
   # email: params[:email], password: params[:password])
  session[:user_id] = @user.id
  redirect to '/lobby'
end

post '/users/login' do
  @user = User.authenticate(params[:user][:email], params[:user][:password])
  if @user
    session[:user_id] = @user.id
    redirect to '/lobby'
  else
    redirect to '/'
  end
end

delete '/logout' do
  session.clear
  redirect to '/'
end