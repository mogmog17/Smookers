class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_guest_user, only: [:edit, :update]
  before_action :set_user, only: [:show, :edit, :update]

  def index
    @user = current_user
    @users = User.page(params[:page]).per(10)
  end

  def show
  end

  def edit
    redirect_to user_path(current_user.id) unless @user == current_user
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "登録情報を変更しました"
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  def favorites
    favorites = Favorite.where(user_id: @user.id).pluck(:post_id)
    @favorite_posts = Post.find(favorites)
  end

  def release
    @user.released! unless @user.released?
    redirect_to edit_user_path(current_user)
  end

  def nonrelease
    @user.nonreleased! unless @user.nonreleased?
    redirect_to edit_user_path(current_user)
  end

  private

  def user_params
    params.require(:user).permit(:username, :introduction, :profile_image)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.username == "guestuser"
      redirect_to user_path(current_user) , notice: 'ゲストユーザーはプロフィール編集画面へ遷移できません'
    end
  end
end
