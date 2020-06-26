class UsersController < ApplicationController
  before_action :authenticate_user!


  def show
   @user = User.find(params[:id])
  	@book = Book.new
  	@books = @user.books
  end

  def index
  	@users = User.all
    @book = Book.new
  end

  def edit
  	@user = User.find(params[:id])
    if @user.id == current_user.id
      render :edit
    else
      redirect_to user_path(current_user.id)
    end
  end

  def update
  	@user = User.find(params[:id])
    if @user.update(user_params)
       flash[:notice] ='You have updated user successfully.'
       redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  def followings
    @user = User.find(params[:id])
    @users = @user.followings
    render 'followings'
  end

  def followers
    @user  = User.find(params[:id])
    @users = @user.followers
    render 'followers'
  end


  private
    def user_params
		params.require(:user).permit(:name, :introduction, :profile_image)
	 end
end
