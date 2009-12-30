require 'sinatra'
require 'rubygems'

template :index do
	'= fortune'
end

error NumberNotExist do
	'Not a valid request'
end

get '/:number/json' do
	num = params[:number].to_i
	if num < 0 or num > 10
		raise NumberNotExist
	else
		myfs = (0..num).map{|x| { 'number' => x, 'fortune' => `fortune`} }
	end
end	

get '/*' do
	haml :index, :locals => { :fortune => `fortune` }
end
