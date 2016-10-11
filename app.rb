require 'sinatra'
require 'sinatra/reloader'

enable :sessions

USERS = [ 
  { 'username': 'foo', 'password': 'foo01' },
  { 'username': 'bar', 'password': 'bar01' },
  { 'username': 'baz', 'password': 'baz01' },
]

get '/' do
  erb :index  
end

post '/login' do
  user = USERS.select {|u| u[:username] == params[:username] && u[:password] == params[:password]}[0]
  if user != nil
    session[:username] = params[:username]
    redirect to('/main')
  else
    erb :error
  end
end

get '/main' do
  @username = session[:username]
  erb :main
end
