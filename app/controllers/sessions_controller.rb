get '/sessions/new' do
  erb :'sessions/new'
end

delete '/sessions' do
  session.clear
  redirect '/'
end

post '/sessions' do
  user = User.find_by(username: params[:username])
  if user && user.password == params[:password]
    session[:user_id] = user.id
    redirect '/'
  else
    erb :'sessions/new', locals: { errors: ["Your username and password combination was not correct - please try again"] }
  end
end
