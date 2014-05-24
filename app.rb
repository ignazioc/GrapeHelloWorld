require 'Grape'

def randomstring(value) 
	(0...value).map { ('a'..'z').to_a[rand(26)] }.join
end


class SampleApi < Grape::API
	version 'v1', using: :path
	format :json

	get '/now' do
		{:result => Time.now()}
	end
	get 'random' do
		{:result => randomstring(10)}
	end
	resource :words do
		get ':word' do
			{:word => params[:word], :sentiment => "unkown"}
		end

		post ':word' do
			{:word => params[:word], :result => "thinking"}
		end 
	end
end