class BooksController < ApplicationController
    
    def index
        books = Book.all
        render(status: 200, json: {status: 200, message: "ok", books: books})
    end

    def show
        book = Book.find(params[:id])
        render(status: 200, json: {status: 200, message: "ok", book: book})
    end

    def create
        book = Book.new(book_params)
        if book.save
            render(status: 201, json: {status: 201, message: "created book #{book.title}", book: book})
        else
            render(status: 422, json: {status: 422, message: "Error: unprocessable entity", entity: book})
        end
    end

    def update
        book = Book.find(params[:id])
        book.update(book_params)
        render(status: 200, json: {status: 200, message: "updated book #{book.title}", book: book})
    end

    def destroy
        book = Book.destroy(params[:id])
        render(status: 200, json: {status: 200, message: "deleted book #{book.title}"})
    end

    private

    def book_params
        params.required(:book).permit(:title, :author, :genre, :publisher, :publish_date, :created_at, :updated_at)
    end
    
end