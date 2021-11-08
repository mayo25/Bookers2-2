class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
    @users = User.all
  end

  def index
    @users = User.all
    @user = current_user
    @books = @user.books
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
   if @user.save
     flash[:notice] = "userinfo was successfully update."
     redirect_to user_path(@user)
   end
  end


  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end


end
