require 'httparty'
require 'nokogiri'

# HTTParty.get  원하는 정보 잇는 주소 요청 보냄
# Nokogiri::HTML() 해당 문서를 검색하기 쉽게 바꾸고
#.css('selector 경로')원하는 정보만 뽑아옴

url = "http://finance.naver.com/sise/"
response = HTTParty.get(url)

html = Nokogiri::HTML(response.body)
kospi = html.css('#KOSPI_now')

puts kospi.text

