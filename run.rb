require 'rubygems'
require 'sinatra'
require 'json'

template :index do
	'= fortune'
end

get '/:number/json' do
	num = params[:number].to_i
	if num < 0 or num > 10
		'Bad Thing'	
	else
		myfs = (0..num).map{|x| [x,"s"] }
		JSON.generate(myfs)	
	end
end	

get '/*' do
	haml :index, :locals => { :fortune => `fortune` }
end
