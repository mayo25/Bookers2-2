class BooksController < ApplicationController
  before_action :ensure_user, only: [:edit, :update, :destroy]
  

  def create
    @book = Book.new(book_params)
    @book.user_id =current_user.id
    @books = Book.all
    if @book.save
    #User詳細
      redirect_to book_path(@book.user_id), notice: "Book was successfully created."
    else
      render :index
    end
  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])

  end
  def edit
     @book = Book.find(params[:id])
  end


  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book.id), notice: "Book was successfully update."
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to book_path(@book.id), notice: "Book was successfully destroy."
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end

  def ensure_user
    @books = current_user.books
    @book = @books.find_by(id: params[:id])
    redirect_to book_path unless @book
  end
