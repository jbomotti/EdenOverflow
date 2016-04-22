get '/questions' do 
	@questions = Question.all
	erb :'questions/index'
end

get '/questions/:id' do 
	@question = Question.find(params[:id])
	@author = User.find(@question.id)
	erb :'questions/show'
end

get '/questions/new' do 
	erb :'questions/new'
end

post '/questions' do
	question = Question.new(params[:question])
	question.save
	if question.save
		redirect '/questions'
	end
end
