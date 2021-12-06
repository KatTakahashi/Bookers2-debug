class BookCommentsController < ApplicationController

  def create
    @book = Book.find(params[:book_id])              #Bookモデルからidを取得
    @comment = BookComment.new(book_comment_params)
    @comment.user_id = current_user.id
    #comment = current_user.book_comments.new(book_comment_params) 省略した書き方
    @comment.book_id = @book.id                         #Book_commentモデルにコメントをするbook_idを渡す
    @comment.save
    render :book_comment
    #redirect_back(fallback_location: root_path)
  end

  def destroy
    BookComment.find_by(id: params[:id]).destroy
    @book = Book.find_by(params[:book_id])
    render :book_comment
    #redirect_back(fallback_location: root_path)
  end

  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end

end
