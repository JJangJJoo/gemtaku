require 'sinatra'

get '/' do
	erb:home
end

get '/lotto' do
	number = [*1..45]
	@rc = number.sample(6).sort
	
		File.open("log.txt", "a+") do |f|
			f.write("#{@rc}"+"\n")
		end
	

 erb:recommend
end	
