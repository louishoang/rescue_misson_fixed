class AnswersController < ApplicationController

  def create

    @question = Question.find(params[:question_id])
    @answer = @question.answers.build(answer_params)
    binding.pry
    @answer.user_id = @question.user_id


      if @answer.save
        redirect_to question_path(@question)
      else
        @answers = @question.answers
        render 'questions/show'
      end

  end

private
    def answer_params

      params.require(:answer).permit(:description, :user_id)
    end

end
