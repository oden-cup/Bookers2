class BooksController < ApplicationController
    before_action :authenticate_user!
    before_action :correct_user,   only: [:edit, :update]

    def correct_user
        @book = Book.find(params[:id])
        if @book.user != current_user
        	redirect_to books_path
        end
    end

    def create
    	@book = Book.new(book_params)
        @book.user_id = current_user.id
  	    if@book.save
  	    redirect_to book_path(@book.id)
  	    flash[:notice] = "You have creatad book successfully."
  	    else
  	    @books = Book.all
  	    render :index
  	    end
    end

    def index
    	@books = Book.all
    	@book = Book.new
    	@users = User.all
    	@user = User.new
    end

    def show
        @book = Book.find(params[:id])
        @books = Book.all
        @book_new = Book.new
    end

    def edit
    	@book = Book.find(params[:id])
    end

    def update
    	@book = Book.find(params[:id])
    	@book.update(book_params)
    	flash[:notice] = "Book was successfully update"
    	if @book.update(book_params)
  	    redirect_to book_path(@book.id)
        else
        @books = Book.all
        render :edit
       end
    end

    def destroy
  	    book = Book.find(params[:id])
  	    book.destroy
  	    redirect_to books_path
  	    flash[:notice] = "Book was successfully destroyed"
    end
    private
    def book_params
    	params.require(:book).permit(:title, :body)
    end
end
