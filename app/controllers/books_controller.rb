class BooksController < ApplicationController
  def new
    @book = Book.new

  end

  def create
    @book = Book.new(book_params)
    @book.user_id =current_user.id
    if @book.save
    #User詳細
      redirect_to user_path(@book.id), notice: "Book was successfully created."
    else
      render :index
    end
  end

  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])

  end
  def edit
     @book = Book.find(params[:id])
  end


  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@book.id), notice: "Book was successfully update."
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.destroy
    redirect_to books_path(@book.id), notice: "Book was successfully destroy."
    else
    render :index
   end
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
