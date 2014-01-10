def require_folder(folder)
  Dir["./#{folder}/*.rb"].each {|file| require file }
end
require 'sinatra'
require 'sinatra/contrib/all'
require 'active_record'
require 'sinatra/activerecord'
#require 'rack'
require_folder("helpers")
require_folder("model")

ENV['RACK_ENV'] ||= "development"
ActiveRecord::Base.establish_connection YAML.load_file("./config/db.yml")[ENV['RACK_ENV'].to_s]

set :method_override, true
set :logging, true
use Rack::MethodOverride

get "/" do
  @blog = Blog.all
  respond_to do |f|
    f.html { erb :index }
    f.json { @blog.to_json }
  end
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
