class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end
  
  def show
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
      flash.now[:danger] = '失敗です！Task が投稿されていません！！'
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @task.update(task_params)
      flash[:success] = 'Task は更新されました！'
      redirect_to @task
    else
      flash.now[:danger] = 'エラー！Task は更新されませんでした。'
      render :edit
    end
    
  end
  
  def destroy
    @task.destroy
    
    flash[:success] = 'Taskは削除されました!'
    redirect_to tasks_url
  end
  
  def task_params
    params.require(:task).permit(:content, :status)
  end

    private
    def set_task
      @task = Task.find(params[:id])
    end
    
    def task_params
      params.require(:task).permit(:content, :status)
    end
end

