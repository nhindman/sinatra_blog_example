configure :development do 
  # establishes our connection to the DB and other settings
  ActiveRecord::Base.establish_connection(
      :adapter => "postgresql",
      :host => "localhost",
      :username => "omardelarosa",
      :database => "simple_blog",
      :encoding => "utf8"
    )
end

configure :production do
  # HEROKU CONFIG 
  db = URI.parse(ENV['HEROKU_POSTGRESQL_AQUA_URL'])
  #configuration info
  ActiveRecord::Base.establish_connection(
      :adapter => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
      :host     => db.host,
      :username => db.user,
      :password => db.password,
      :database => db.path[1..-1],
      :encoding => 'utf8'
  )
end