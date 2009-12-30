require 'sinatra'
require 'rubygems'

template :index do
	'= fortune'
end

get '/*' do
	haml :index, :locals => { :fortune => `fortune` }
end
