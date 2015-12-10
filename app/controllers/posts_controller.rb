get '/' do
  @posts = Post.all
  erb :'posts/index'
end

get '/posts/new' do
  erb :'posts/form'
end

post '/posts' do
  @post = Post.new(title: params[:title], body: params[:body])
    if @post.save
      erb :'posts/index'
    else
      redirect '/'
      erb :'posts/form'
  end
end

get '/posts/:id' do
  @post = Post.find_by(id: params[:id])
  erb :'posts/show'
end

delete '/posts/:id' do
  @post = Post.find_by(id: params[:id])
  if @post.delete
    redirect '/'
  else
    erb :'posts/show'
  end
end