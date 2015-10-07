class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update]
  
  def edit
  end
  
  def update
    if @user.update(update_user_params)
      redirect_to user_path, :notice => "プロフィールを更新しました"
    else
      render 'edit'
    end
  end
  
  
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts
  end
  
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(new_user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  private
  
  def new_user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end
  
  def update_user_params
    params.require(:user).permit(:name, :email, :location, :profile)
  end
  
  def set_user
    @user = User.find(params[:id])
  end
end
