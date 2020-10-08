class TasksController < ApplicationController
  def index
    @tasks = current_user.tasks.order(created_at: :desc)
  end

  def show
    @task = current_user.tasks.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def edit
    @task=Task.find(params[:id])
  end

  def create
    @task= current_user.tasks.new(task_params)
    if @task.save
      flash[:notice]="タスク「#{@task.name}」を登録しました。"
      redirect_to("/")
    else
      render("/tasks/new")
    end
  end

  def update
    @task =Task.find(params[:id])
    @task.update(task_params)
    flash[:notice]="タスク「#{@task.name}」を更新しました。"
    redirect_to("/")
  end

  def destroy
    @task=Task.find(params[:id])
    @task.destroy
    flash[:notice]="タスク「#{@task.name}」を削除しました。"
    redirect_to("/")
  end

  private
  def task_params
    params.require(:task).permit(:name,:description)
  end
end
