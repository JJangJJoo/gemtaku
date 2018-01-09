require 'httparty'
require 'awesome_print'
require 'json'
require 'uri'
require 'nokogiri'

URL = "https://api.telegram.org/bot"
token = "469766728:AAHaVEq0eAni5t3jO2XXC1K0gKaB8UtDgHI"

response = HTTParty.get("#{URL}#{token}/getUpdates")
hash = JSON.parse(response.body)

chat_id = ap hash["result"][0]["message"]["from"]["id"]

# kospi 지수 스크랩
res = HTTParty.get("http://finance.naver.com/sise/")
html = Nokogiri::HTML(res.body)
kospi = html.css('#KOSPI_now').text

msg = "오늘 코스피 지수는 #{kospi}"
encoded = URI.encode(msg)

HTTParty.get("#{URL}#{token}/sendMessage?chat_id=#{chat_id}&text=#{encoded}")

#로또번호 확인
res = HTTParty.get("http://www.nlotto.co.kr/common.do?method=getLottoNumber&drwNo=784")
lotto = JSON.parse(res.body)

lucky = []
6.times do |n|
  lucky << lotto["drwtNo#{n+1}"]
end

bonus = lotto["bnusNo"]

winner = lucky.to_s

msg = "로또당첨번호는 #{winner} 보너스번호는 #{bonus}"
encoded = URI.encode(msg)

HTTParty.get("#{URL}#{token}/sendMessage?chat_id=#{chat_id}&text=#{encoded}")
