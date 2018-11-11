class ArticlesController < ApplicationController
    before_action :authenticate_user!, except: [:show, :index]
    before_action :set_article, only: [:show, :edit, :update, :destroy]
    before_action :check_owner, only: [:edit, :update, :destroy]

    def new
        @article = Article.new
    end
    
    def create
        @article = Article.new(article_params)
        @article.user = current_user
        if @article.save
            redirect_to article_url(@article)
        else
            render 'new'
        end
    end
    
    def show
    end

    def edit
    end
    
    def index
        @articles = Article.page(params[:page]).per(10)
    end
    
    def update
        if @article.update(article_params) && @article.user == current_user
            redirect_to article_url(@article)
        else
            render 'edit'
        end
    end
    
    
    def destroy
        if @article.destroy
            redirect_to articles_url
        else
            redirect_back fallback_location: article_url(@article)
        end
    end

    private
        def set_article
            @article = Article.find(params[:id])
        end
        
        def article_params
           params.require(:article).permit(:starting_point, :destination) 
        end

        def check_owner
            redirect_back fallback_location: root_url if @article.user != current_user
        end
end
