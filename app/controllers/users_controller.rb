class UsersController < ApplicationController
before_action :authenticate_user!
  def show
  	@user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
  end

  def create
    @users = User.new(user_params)
    @users.user_id = current_user.id
    @user.save
    flash[:notice] = "Welcome! You have signed up successfully."
    redirect_to user_path
  end

  def index
    @user = User.new
    @users = User.all
    @book = Book.new
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
   if @user.update(user_params)
    flash[:notice] = "You have updated user successfully."
    redirect_to user_path(@user.id)
   else
      render :edit
    end
  end

   private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
  def book_params
    params.require(:book).permit(:title,:body)
  end
end
