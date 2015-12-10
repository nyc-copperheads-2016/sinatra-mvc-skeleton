get '/' do
  @post = Post.all
  erb :'/posts/index'
end

get '/posts/new' do
  erb :'/posts/form'

end