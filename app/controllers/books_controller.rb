class BooksController < ApplicationController
  before_action :authenticate_user!
	def index
		@books= Book.all
  		@book= Book.new
	end
  def show
    @book= Book.find(params[:id])
  end
	def edit
		@book= Book.find(params[:id])
    if @book.user!=current_user
        redirect_to books_path
    end

	end

	def create
    @book=Book.new(book_params)
    @book.user_id = current_user.id
    @books= Book.all
    if @book.save
      flash[:notice]="You have creatad book successfully."
    redirect_to book_path(@book.id)
  else
    render action: :index
    end
  end
  def update
    @book=Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice]="You have updated book successfully."
    redirect_to book_path(@book.id)
    else
      render action: :edit
    end
  end

  def destroy
    @book=Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private

    def book_params
        params.require(:book).permit(:title, :body)
    end


end
