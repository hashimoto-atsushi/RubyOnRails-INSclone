class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to new_session_path
  end

  def destroy
    @user = User.find(params[:id])
    if current_user.present?
      debugger
    @blog = Blog.where(user_id: current_user.id)
    @blog.destroy_all
    end
    @user.destroy
    redirect_to new_session_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
