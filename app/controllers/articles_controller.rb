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

    def edit
        @article = Article.find(params[:id])
    end

    def create
        @article = Article.new(params.require(:article).permit(:title, :description))
        if @article.save
        # redirect to articles show page
            flash[:notice] = "Alert was created successfully."
            redirect_to @article
        # render @article, status: :unprocessable_entity
        else
            render 'new', status: :unprocessable_entity
        end
    end

    def update
        # Find article that needs to be edited
        @article = Article.find(params[:id])
        #  update the article. We need to white list and make title, and descriptin available to use
        if @article.update(params.require(:article).permit(:title, :description))
            flash[:notice] = 'Article was updated successfully.'
            redirect_to @article
        else
            render 'edit', status: :unprocessable_entity
        end
    end
end