require 'sinatra'
require 'sinatra/reloader'
require 'httparty'
require 'json'
require 'date'
require 'data_mapper'
require './model.rb'

set :bind, '0.0.0.0'

get '/' do
  erb :index
end

get '/scrap' do
  #월~일까지의 웹툰 차례긁어온다
  #1. 월요일 웹툰 차례긁어온다
  #2. 화요일웹툰 긁어온다
  days = ["mon", "tue", "wed", "thu","fri","sat","sun"]
  days.each do |day|
    url = "http://webtoon.daum.net/data/pc/webtoon/list_serialized/#{day}"
    response = HTTParty.get(url)
    hash = JSON.parse(response.body)
    @webtoons = Array.new #또는 []
    hash["data"].each do |webtoon|
      toon = {
          name: webtoon["title"],
          desc: webtoon["introduction"],
          score: webtoon["averageScore"].round(2), #반올림하는코드추가
          img_url: webtoon["appThumbnailImage"]["url"],
          url: "http://webtoon.daum.net/webtoon/view/#{webtoon['nickname']}"
      }
      #5. view에서 보여주기위해 @webtoons라는 변수에 담는다.
      @webtoons << toon
    end
end

@webtoons.each do |webtoon|
  Webtoon.create(
    name: webtoon[:name],
    desc: webtoon[:desc],
    score: webtoon[:score],
    img_url: webtoon[:img_url],
    url: webtoon[:url]
  )
  end
end
# get '/week/:day' do
#   day = params[:day]
#   url = "http://webtoon.daum.net/data/pc/webtoon/list_serialized/#{day}"
#
#   #2. 해당 url에 요청을 보내고 데이터를 받는다.
#   response = HTTParty.get(url)
#   #3. JSON형식으로 날아온 데이터를 HASH형식으로 바꾼다.
#   hash = JSON.parse(response.body)
  #4. key를 이용해서 원하는 데이터만 수집한다.
  # 원하는 데이터: 제목, 이미지, 실제로보는 웹툰 링크, 소개, 평점
  #평점 : averageScore
  #제목 : title
  #소개 : introduction
  #이미지 : appThumbnailImage["url"]
  #웹툰링크 : "http://webtoon.daum.net/view/#{nickname}"
#   @webtoons = Array.new #또는 []
#   hash["data"].each do |webtoon|
#     toon = {
#         name: webtoon["title"],
#         desc: webtoon["introduction"],
#         score: webtoon["averageScore"].round(2), #반올림하는코드추가
#         img_url: webtoon["appThumbnailImage"]["url"],
#         url: "http://webtoon.daum.net/webtoon/view/#{webtoon['nickname']}"
#     }
#     #5. view에서 보여주기위해 @webtoons라는 변수에 담는다.
#     @webtoons << toon
#   end
#     erb :day
# end



get '/today' do
  #1. url을 만든다
  time = Time.now.to_i
  week = DateTime.now.strftime("%a").downcase
  url = "http://webtoon.daum.net/data/pc/webtoon/list_serialized/#{week}?timeStamp=#{time}"
  puts url

  #2. 해당 url에 요청을 보내고 데이터를 받는다.
  response = HTTParty.get(url)
  #3. JSON형식으로 날아온 데이터를 HASH형식으로 바꾼다.
  hash = JSON.parse(response.body)
  #4. key를 이용해서 원하는 데이터만 수집한다.
  # 원하는 데이터: 제목, 이미지, 실제로보는 웹툰 링크, 소개, 평점
  #평점 : averageScore
  #제목 : title
  #소개 : introduction
  #이미지 : appThumbnailImage["url"]
  #웹툰링크 : "http://webtoon.daum.net/view/#{nickname}"
  @webtoons = Array.new #또는 []
  hash["data"].each do |webtoon|
    toon = {
        name: webtoon["title"],
        desc: webtoon["introduction"],
        score: webtoon["averageScore"].round(2), #반올림하는코드추가
        img_url: webtoon["appThumbnailImage"]["url"],
        url: "http://webtoon.daum.net/webtoon/view/#{webtoon['nickname']}"
    }
    #5. view에서 보여주기위해 @webtoons라는 변수에 담는다.
    @webtoons << toon
  end

  puts @webtoons


  erb :webtoon_list
end
