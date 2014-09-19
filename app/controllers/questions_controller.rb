class QuestionsController < ApplicationController
  def index
    @questions = Question.order(created_at: :desc)
  end

  def new
    @question = Question.new
  end

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers.order(created_at: :desc)
    @answer = Answer.new
  end

  def create
    @user = User.find(current_user.id)
    @question = Question.new(question_params)
    @question.user_id = @user.id
    respond_to do |format|
      if @question.save
        format.html { redirect_to @question}
      else
        format.html { render action: 'new' }
      end
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update

    @question = Question.find(params[:id])
    # @question.best_answer_id = params[:format]
    if @question.update(question_params)
      redirect_to @question
    else
      render 'edit'
    end
  end

  def destroy
    Question.find(params[:id]).destroy
    redirect_to '/questions'
  end

private
  def question_params
    if params[:question]
      params.require(:question).permit(:title, :description, :user_id)
    else
      {:best_answer_id => params[:format]}
    end
  end
end
