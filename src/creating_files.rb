puts Dir.pwd
Dir.chdir('src')
puts Dir.pwd

20.times do |n|
	File.open("#{n + 1}list.txt", "w") do |f|
		f.write("#{n + 1}번쨰 파일입니다")
		# File.rename("#{n + 1}list.txt", "#{n + 1}번파일입니다")
	end
end	

# .txt 20개를 만든다.
# 몇번째 파일 + list
# 1list.txt> 내용물 : 1번째 파일입니다
# 2list.txt > 내용물 : 2번째 파일입니다

=begin
#concatenation : 합체 "" + ""
age = 55
puts "내 나이는" + age.to_s
=end

#interpolation : 인터폴(수술) "()"
# age = 55
# puts "내 나이는 #{age}"

