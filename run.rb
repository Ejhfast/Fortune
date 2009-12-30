require 'rubygems'
require 'sinatra'
require 'json'

template :index do
	'= fortune'
end

get '/json/:number' do
	num = params[:number].to_i
	if num < 0 or num > 10
		'Bad Thing'	
	else
		# Generate the fortunes, and put them in a hash
		myfs = (0..num).map{|x| [x,`fortune`] }
		h = Hash.new
		myfs.each do |idx|
			h[idx[0]] = idx[1]
		end
		JSON.generate(h)	
	end
end	

get '/*' do
	haml :index, :locals => { :fortune => `fortune` }
end
