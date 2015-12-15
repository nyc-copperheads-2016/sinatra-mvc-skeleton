get '/sessions/new' do
  erb :'/sessions/new', locals:{errors:[params[:errors]]}
end

delete '/sessions' do
  session.clear
  redirect '/'
end

post '/sessions' do
  user = User.find_by(username: params[:username])

  if user && user.password == params[:password]
    session[:user_id] = user.id
    erb :home  #this line needs to be changed to your home page
  else
    redirect '/sessions/new?errors=incorrect_user_or_password'
  end
end