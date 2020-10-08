class Admin::UsersController < ApplicationController
  before_action :require_admin

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end



  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice]="ユーザー「#{@user.name}」を登録しました。"
      redirect_to("/admin/users/#{@user.id}")
    else
      render("/admin/users/new")
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice]="ユーザー「#{@user.name}」を更新しました。"
      redirect_to("admin/users/#{@user.id}")
    else
      render("/admins/users/#{@user.id}/edit")
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice]="ユーザー「#{@user.name}」を削除しました。"
    redirect_to("/admin/users")
  end


  private
  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation)
  end

  def require_admin
    redirect_to root_path unless current_user.admin?
  end
end
