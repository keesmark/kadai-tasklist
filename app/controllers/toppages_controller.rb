class ToppagesController < ApplicationController
  def index
    if logged_in?
      @user = current_user
      @tasklist = current_user.tasklists.build
      @tasklists = current_user.tasklists.order('created_at DESC').page(params[:page])
      redirect_to @user
    end
  end
end
