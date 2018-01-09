require 'sinatra'

get '/' do
  erb :index
end


get '/write' do
  #글을 저장하고
  @title = params["title"] #index에서 날려준 title params에 임시로 저장되있음
  @content = params["content"]  #index에서 날려준 content params에 임시 저장되있음
  File.open("blog.txt", "a") do |f|
    f.write("title: #{@title}  , content: #{@content} ")
    f.write("\n")
end
  erb :write #글이 성공적으로 작성됨
end


get '/show' do
  @list = []
  File.open("blog.txt","r") do |f|
    f.each_line do |line|
      @list << line
    end
  end

  erb :show
end
