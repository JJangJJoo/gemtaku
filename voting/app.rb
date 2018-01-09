require 'sinatra'
require 'CSV'

get '/' do
  erb :index
end

get '/vote' do
  @name = params["vname"]
  @vote = params["vote"]

   CSV.open("vote.csv", "a") do |row|
     row << [@name, @vote]
   end

  erb :vote
end

# 배열형태의 csv데이터를 또하나의 배열을 만들어 담음(이중배열)형태 [[asdf,1],[qwer,2]]


get '/result' do
  @list = Array.new
  @count = Hash.new(0)
  CSV.foreach("vote.csv") do |row|

    @list << row
    if row[1] == "1"
      @count["1hour"] += 1
    elsif row[1] == "2"
      @count["2hour"] += 1
    elsif  ow[1] == "3"
      @count["3hour"] += 1

    end
  end
  erb :result
end
