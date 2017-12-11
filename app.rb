require 'sinatra'

# 10minutes 메일서비스 애용

get '/' do
  @q_list = Array.new
  # 파일 없으면 에러
  File.open("question.txt", "r") do |f|
      f.each_line do |line|
        @q_list << line
      end
  end
  erb :index
end

get '/ask' do
  @q = params['question']
  @id = params['id']

  File.open("question.txt", "a") do |f|
    f.write(@id + ": " + @q)
    f.write("\n")
  end
  erb :ask
end
