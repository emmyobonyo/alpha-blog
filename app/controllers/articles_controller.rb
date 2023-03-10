class ArticlesController < ApplicationController
    before_action :set_article, only: [:show, :edit, :update, :destroy]
    before_action :require_user, except: [:show, :index]
    before_action :require_same_user, only: [:edit, :update, :destroy]
    def show
        
    end

    def index
        @articles = Article.paginate(page: params[:page], per_page: 5)
    end

    def new
        # We need this for the first time the page loads so that we can have something in our article
        @article = Article.new
    end

    def edit
        
    end

    def create
        @article = Article.new(article_params)
        # Code below Assign every article to the first user of the article
        # @article.user = User.first
        @article.user = current_user
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
        # The function that does this is below
        
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
        # The function that does this is below
        
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

    def require_same_user 
        if current_user != @article.user && !current_user.admin?
            flash[:alert] = "You can only edit or delete your own article"
            redirect_to @article
        end
    end

end