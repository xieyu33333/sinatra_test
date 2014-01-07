#require 'app.rb'
require 'active_record'
ActiveRecord::Base.establish_connection(
  :adapter  => "mysql2",
  :host     => "127.0.0.1",
  :username => "root",
  :password => "root",
  :database => "sinatra_test"
)
require 'sinatra/activerecord/rake'
require File.expand_path('../config/initializers/application', __FILE__)

# Test::Application.load_tasks
# namespace :db do
#    task :environment do
#      require 'active_record'
#      ActiveRecord::Base.establish_connection(
# 	  :adapter  => "mysql2",
# 	  :host     => "127.0.0.1",
# 	  :username => "root",
# 	  :password => "root",
# 	  :database => "sinatra_test"
# 	)
#    end
 
#    desc "Migrate the database"
#    task(:migrate => :environment) do
#      ActiveRecord::Base.logger = Logger.new(STDOUT)
#      ActiveRecord::Migration.verbose = true
#      ActiveRecord::Migrator.migrate("db/migrate")
#    end
# end