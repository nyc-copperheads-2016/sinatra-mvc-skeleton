get '/' do
  if session[:user_id]
    redirect #'/posts'
  else
    redirect '/sessions/new'
  end
end
