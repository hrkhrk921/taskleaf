class TasksController < ApplicationController
  def index
    @tasks=Task.all
  end

  def show
    @task=Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def edit
  end

  def create
    @task= Task.new(task_params)
    if @task.save
      flash[:notice]="タスク「#{@task.name}」を登録しました。"
      redirect_to("/")
    else
      render("/tasks/new")
    end
  end

  private
  def task_params
    params.require(:task).permit(:name,:description)
  end
end
