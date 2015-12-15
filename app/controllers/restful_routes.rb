# Root. Display all entries.
get '/entries' do
  @entries = Entry.order(created_at: :desc)
  erb :'/entries/index'
end


# Add a new entry (form page).
get '/entries/new' do
  erb :'/entries/new'
end

post '/entries' do
  @new_entry = Entry.new(params[:entry])
  if @new_entry.save
    redirect "/"
  else
    erb :'entries/new'
  end
end


# Display an existing entry.
get '/entries/:id' do
  @entry = Entry.find(params[:id])
  erb :'entries/show'
end


# Edit an existing entry form page.
get '/entries/edit/:id' do
  @entry = Entry.find(params[:id])
  erb :'/entries/edit'
end

put '/entries/:id' do
  entry = Entry.find(params[:id])
  entry.update_attributes(params[:entry])
  redirect "/entries/#{entry.id}"
end


# Delete an existing entry.
delete '/entries/:id' do
  entry = Entry.find(params[:id])
  entry.destroy
  redirect '/'
end
