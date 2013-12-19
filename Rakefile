require 'active_record'
require 'sinatra'
# configures the database
require_relative 'config/environments'
require "sinatra/activerecord/rake"
require_relative 'models/user'
require_relative 'models/post'


# Mario's rake db:seed task
namespace :db do
  desc "Seed Empty simple_blog2 Database"
  task :seed do
    user0 = User.create(:last_name => "onimous", :first_name => "ann", :username => "anonymous")
    puts "user #{user0.username} was created!"
    user1 = User.create(:last_name => "Abruzzi", :first_name => "Mario", :username => "abruzzi")
    puts "user #{user1.username} was created!"
    user2 = User.create(:last_name => "Ziecheck", :first_name => "Wendy", :username => "ziecheckw")
    puts "user #{user2.username} was created!"
    user3 = User.create(:last_name => "Kravitz", :first_name => "Jordan", :username => "kravitzj")
    puts "user #{user3.username} was created!"
    user4 = User.create(:last_name => "Ramage", :first_name => "Ariel", :username => "ramagea")
    puts "user #{user4.username} was created!"
    post = Post.create(:title => "Seed Post", :body => "I am part of your database from the start!", user: user0)
    puts "post #{post.title} was created!"
  end
end

namespace :count do 
  desc "count to 100"
  task :to_100 do 
    (1..100).each do |n|
      puts "#{n}"
    end
  end
end

namespace :greet do 

  desc "says hello"
  task :hello do 
    puts "Hello!"
  end

  desc "says goodbye"
  task :goodbye do 
    puts "Goodbye!"
  end
end