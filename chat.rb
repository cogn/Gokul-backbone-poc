
require 'rubygems'
require 'sinatra'
require 'json'

@@data = []
@@count = 0

configure do
  set :public_folder, Proc.new { File.join(root, "static") }
end

get '/' do
  erb 'Launching soon!!! Please keep in touch with us by <a href="/chat">Chat</a>'
end

get '/chat' do
  erb :chat
end

get '/messages' do
  content_type :json
  @@data.to_json
end

post '/messages' do
  content_type :json
  message = JSON.parse(request.body.read.to_s).merge(:id => @@count += 1 )
  @@data << message
  message.to_json
end

