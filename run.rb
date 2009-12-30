require 'rubygems'
require 'sinatra'
require 'json'

template :index do
	'= fortune'
end

get '/json/:number' do
	num = params[:number].to_i
	if num < 0 or num > 10
		'That is not an allowed number of fortunes...'	
	else
		# Generate the fortunes, and put them in a hash
		h = Hash.new
		(0..num).each do |idx|
			h[idx] = `fortune`
		end
		JSON.generate(h)	
	end
end	

get '/*' do
	haml :index, :locals => { :fortune => `fortune` }
end
