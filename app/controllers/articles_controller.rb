class ArticlesController < ApplicationController
    def show
        @article = Article.find(params[:id])
    end

    def index
        @articles = Article.all
    end

    def new
        # We need this for the first time the page loads so that we can have something in our article
        @article = Article.new
    end

    def create
        @article = Article.new(params.require(:article).permit(:title, :description))
        if @article.save
        # redirect to articles show page
            redirect_to @article
        # render @article, status: :unprocessable_entity
        else
            render 'new', status: :unprocessable_entity
        end
    end
end