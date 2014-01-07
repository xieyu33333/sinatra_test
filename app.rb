def require_folder(folder)
  Dir["./#{folder}/*.rb"].each {|file| require file }
end
require 'sinatra'
require 'sinatra/contrib/all'
require 'active_record'
require 'sinatra/activerecord'
require_folder("helpers")
require_folder("model")

ActiveRecord::Base.establish_connection(
  :adapter  => "mysql2",
  :host     => "127.0.0.1",
  :username => "root",
  :password => "root",
  :database => "sinatra_test"
)

set :method_override, true
set :logging, true
use Rack::MethodOverride

get "/" do
  @blog = Blog.all
  erb :index
end

get "/api/blogs/index" do
  @blog = Blog.all
  json @blog
end 

get "/blogs/new" do
  @blog=Blog.new
  erb :new
end

post "/blogs/:id" do
  @blog = Blog.find(params[:id])
  @blog.update_attributes(:title=>params[:title], :content=>params[:content])
  @blog.save
  redirect "/"
end

get "/blogs/:id/edit" do
  @blog = Blog.find(params[:id])
  erb :new
end

post "/blogs" do
  @blog = Blog.new(:title=>params[:title], :content=>params[:content])
  @blog.save
  redirect '/'
end

delete "/blogs/:id" do
  @blog = Blog.find(params[:id])
  @blog.destroy
  redirect "/"
end

get "/blogs/:id" do
  @blog = Blog.find(params[:id])
  erb :show
end

error 403 do
  'Access forbidden'
end

error 404 do
  'No exist'
end
