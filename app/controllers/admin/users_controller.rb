class Admin::UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if user.save
      flash[:notice]="ユーザー「#{@user.name}」を登録しました。"
      redirect_to("/admin/users/#{@user.id}")
    else
      render("/admin/users/new")
    end
  end

  def edit
  end

  def show
  end

  def index
  end

  private
  def user_params
    params.require(:user).permit(:name,:email,:password,:password_confirmation)
  end
end