class BooksController < ApplicationController

  def show
    @books = Book.find(params[:id])    #22.debug.@bookを@booksに書き換え
    @book = Book.new                   #22.debug:追加
    @user = @books.user                #20.debug:追加
  end

  def index
    @books = Book.all
    @book = Book.new #17.debug:追加
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book), notice: "You have created book successfully."
    else
      @books = Book.all
      render 'index'
    end
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user == current_user   #28.debug:追加
      render :edit                  #28.debug:追加
    else                            #28.debug:追加
      redirect_to books_path        #28.debug:追加
    end                             #28.debug:追加
  end



  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book), notice: "You have updated book successfully."
    else
      render "edit"
    end
  end

  def destroy #23.debug:deleteをdestroyに書き換え
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body) #11?.debug::body追加
  end

end
