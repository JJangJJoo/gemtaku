require 'sinatra'

get '/' do

	send_file 'home.html'
end

get '/me' do 
	send_file 'me.html'
end

get '/dinner' do
	#점심추천 로직
	#1. 배열만들어 메뉴 넣고
	#2. 랜덤으로 하나 뽑아 출력
	menu = ["참치회","송로버섯","샥스핀"]
	@choice = menu.sample
	@url = {
		"참치회" => 'http://image.chosun.com/sitedata/image/201503/16/2015031602655_3.jpg',
		"송로버섯" => 'http://mblogthumb4.phinf.naver.net/20151103_195/mardukas_1446513583767TT9de_JPEG/KakaoTalk_20151102_212632906.jpg?type=w2',
		"샥스핀" => 'http://korean.cri.cn/mmsource/images/2014/01/18/e8e7e8616be54d81bff26a47968b3d65.jpg'
	}

	url["참치회"]
	url["송로버섯"]
	url["샥스핀"]
# 	url = ""
# 	if choice == "참치회"
# 		url='http://image.chosun.com/sitedata/image/201503/16/2015031602655_3.jpg'
# 	elsif choice == "송로버섯"
# 		url = 'http://mblogthumb4.phinf.naver.net/20151103_195/mardukas_1446513583767TT9de_JPEG/KakaoTalk_20151102_212632906.jpg?type=w2'
# 	elsif choice == "샥스핀"
# 		url='http://korean.cri.cn/mmsource/images/2014/01/18/e8e7e8616be54d81bff26a47968b3d65.jpg'	
# # end
erb:dinner
end

# 	"<p>#{choice}</p>
# 	<img src=#{url[choice]}>
# 	"
# end
