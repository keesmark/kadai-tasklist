class TasklistsController < ApplicationController
  before_action :require_user_logged_in

  def create
    @tasklist = current_user.tasklists.build(tasklist_params)
    if @tasklist.save
      flash[:success] = 'メッセージを投稿しました。'
      redirect_to root_url
    else
      @tasklists = current_user.tasklists.order('created_at DESC').page(params[:page])
      flash.now[:danger] = 'メッセージの投稿に失敗しました。'
      render 'toppages/index'
    end
  end

  def destroy
    @tasklist = Tasklist.find(params[:id])
    @tasklist.destroy
    flash[:success] = 'メッセージを削除しました。'
    redirect_back(fallback_location: root_path)
  end
  
  def show
    @user = User.find(params[:id])
    @tasklists = @user.tasklistts.order('created_at DESC').page(params[:page])
    counts(@user)
  end
  
  
  private

  def tasklist_params
    params.require(:tasklist).permit(:content, :status, :edit)
  end

end


