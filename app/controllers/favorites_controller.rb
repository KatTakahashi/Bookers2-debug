class FavoritesController < ApplicationController

  def create
    @book = Book.find(params[:book_id])
    favorite = current_user.favorites.new(book_id: @book.id)
    favorite.save
    #redirect_back(fallback_location: root_path) ※JavaScriptリクエスト
    #redirect_to book_path(book) ※indexでいいねしてもshowページへ飛ぶ ⇒ redirect_backに書き換え
  end

  def destroy
    @book = Book.find(params[:book_id])
    favorite = current_user.favorites.find_by(book_id: @book.id)
    favorite.destroy
    #redirect_back(fallback_location: root_path)
    #redirect_to book_path(book)
  end

end
