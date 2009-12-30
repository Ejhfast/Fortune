require 'sinatra'
require 'rubygems'

template :index do
	'%p= fortune'
end

get '/*' do
	haml :index, :locals => { :fortune => `ls` }
end
