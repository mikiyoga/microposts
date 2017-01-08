class UsersController < ApplicationController
  before_action :auth_user, only: [:show, :edit,:update,:following, :followers]#追加
  
  def show # 追加
   @microposts = @user.microposts.order(created_at: :desc)
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
     @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end
    
  def following #追加
     @following_users = @user.following_users
      render 'show_follow'
  end
    
  def followers　#追加
    @followed_users = @user.followed_users
      render 'show_follow'
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :profile, :address,
    :password_confirmation)
  end
  
  def auth_user
   @user = User.find(params[:id])
    if current_user != @user
      redirect_to root_path
  end
    end

end


  



