class ArticlesController < ApplicationController
    def index
        @articles = Article.all;
    end
    
    def create
        #article_params[:];
        article = Article.new
        article.title = article_params[:title];
        article.description = article_params[:description];
        #render plain: article.save;
        article.save;
        redirect_to article;
    end
    
    def new 
        @article = Article.new;
    end
    
    def show
        @article = Article.find(params[:id]);
        if @article == nil
            render plain: 'Error';   
        end
    end
    
    def article_params
        return params.require(:article).permit(:title , :description);
    end
end
