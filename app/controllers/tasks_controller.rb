class TasksController < ApplicationController
  def index
  end

  def show
  end

  def new
    @task = Task.new
  end

  def edit
  end

  def create
    @task= Task.new(task_params)
    if @task.save
    redirect_to("/"),notice: "タスク「#{@task.name}」を登録しました。"
    else
      render("/tasks/new")
    end
  end

  private
  def task_params
    params.require(:task).permit(:name,:description)
  end
end
