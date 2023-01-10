class ArticlesController < ApplicationController
    before_action :set_article, only: [:show, :edit, :update, :destroy]
    def show
        
    end

    def index
        @articles = Article.all
    end

    def new
        # We need this for the first time the page loads so that we can have something in our article
        @article = Article.new
    end

    def edit
        
    end

    def create
        @article = Article.new(article_params)
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
        
        #  update the article. We need to white list and make title, and descriptin available to use
        if @article.update(article_params)
            flash[:notice] = 'Article was updated successfully.'
            redirect_to @article
        else
            render 'edit', status: :unprocessable_entity
        end
    end

    def destroy
        # Find article to be deleted based on the id
        
        @article.destroy
        redirect_to articles_path
    end

    private

    def set_article 
        @article = Article.find(params[:id])
    end

    def article_params
        params.require(:article).permit(:title, :description)
    end

end