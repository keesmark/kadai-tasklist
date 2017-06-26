class TasksController < ApplicationController
  
  def index
    @tasks = Task.all
  end
  
  def show
    @task = Task.find(params[:id])
  end
  
  def new
    @task = Task.new
  end
  
  def create
    @task = Task.new(task_params)
    
    if @task.save
      flash[:success] = 'Task が投稿されました！'
      redirect_to @task
    else
      flash[:danger] = '失敗です！Task が投稿されていません！！'
      render :new
    end
  end
  
  def edit
    @task = Task.find(params[:id])
  end
  
  def update
    @task = Task.find(params[:id])
    
    if @task.update(task_params)
      flash[:success] = 'Task は更新されました！'
      redirect_to @task
    else
      flash.now[:danger] = 'エラー！Task は更新されませんでした。'
      rander :edit
    end
    
  end
  
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    
    flash[:success] = 'Taskは削除されました!'
    redirect_to tasks_url
  end
  
  
end

private
def task_params
  params.require(:task).permit(:content)
end
