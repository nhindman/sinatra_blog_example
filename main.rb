require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/activerecord/rake'
ActiveRecord::Base.logger = Logger.new(STDOUT)

# configures the database
require_relative 'config/environments'

# models included
require_relative 'models/post'
require_relative 'models/user'

# enable sessions
enable :sessions

# set environment variables
set :environment, :development

get '/' do 
  @username = session[:username] if session[:username]
  erb :home
end

# Posts Routes
get '/posts' do
  @username = session[:username] if session[:username]
  @users = User.all
  @posts = Post.all
  p @posts
  erb :"posts/index"
end

get '/post/:id' do
  @username = session[:username] if session[:username]
  id = params[:id].to_i
  @post = Post.find(id)
  p "ID: #{id}"
  p params
  p @post
  erb :"posts/show"
end

get '/posts/:id/edit' do
  @username = session[:username] if session[:username] 
  id = params[:id].to_i
  @post = Post.find(id)
  p "ID: #{id}"
  p params
  p @post
  erb :"posts/edit"
end

post '/posts/update' do
  @username = session[:username] if session[:username]
  id = params[:id].to_i 
  post = Post.find(id)
  post.title = params[:title]
  post.body = params[:body]
  post.save!
  redirect '/posts'
end

post '/posts/delete/:id' do 
  # @username = session[:username] if session[:username]
  id = params[:id]
  Post.delete(id)
  redirect '/posts'
end

post '/posts/create' do 
  @username = params[:username]
  title = params[:title]
  body = params[:body]
  # user_id = params[:user_id].to_i
  # create_new_post(title, body)
  # user = User.find(user_id)

  user = User.where("username='#{@username}'").first

  Post.create(title: title, body: body, user: user)
  redirect '/posts'
end

# Users routes

get '/users/new' do
  @username = session[:username] if session[:username]
  erb :"users/new"
end

get '/users/sign_in' do
  @username = session[:username] if session[:username]
  erb :"users/sign_in"
end

# Ethan's HTTP method handler
post '/users/create' do
  @username = session[:username] if session[:username]
  first_name = params[:first_name]
  last_name = params[:last_name]
  username = params[:username].downcase
  bio = params[:bio]
  user = User.create(first_name: first_name, last_name: last_name, username: username, bio: bio)
  
  # Matt P.'s Way

  # user = User.new
  # user.first_name = params[:first_name]
  # user.last_name = params[:last_name]
  # user.username = params[:username].downcase
  # user.bio = params[:bio]
  # user.save!

  # Yet another Way:

  # user = {}
  # user[:first_name] = params[:first_name]
  # user[:last_name] = params[:last_name]
  # user[:username] = params[:username].downcase
  # user[:bio] = params[:bio]
  # User.create(user)


  redirect '/'
end

# Session Routes

post '/sessions/create' do 
  session[:username] = params[:username]
  redirect "/"
end