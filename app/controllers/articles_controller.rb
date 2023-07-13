class ArticlesController < ApplicationController
    def index
    end

    def new
        #實體變數
        @article = Article.new
    end

    def create
        # 加強版 params 無論你用符號 或 字串 都拿得到
        # render html: params[:title] 

        # ORM = Object Relation Mapping
        # cc = Article.new
        # cc.title = params[:cc][:title]
        # cc.content = params[:cc][:content]
        # cc.save

        # article = Article.new(title: params[:cc][:title], content: params[:cc][:content])
        # article.save

        #ForbbidenAttribute
        #article = Article.new(params[:cc]) 
        #article.save

        #Strong Paramenter (Why)
        # clean_params = params.require(:article).permit(:title, :content)
        # article = Article.new(clean_params) 
        # article.save

        # def article_params
        #     params.require(:article).permit(:title, :content)
        # end

        # article = Article.new(article_params) 
        # article.save

        # # 快閃訊息 像是 Hash
        # # 只有 notice 跟 alert 
        # flash[:notice] = "文章新增成功"
        # flash[:alert] = "大失敗！"
        # redirect_to "/articles", notice: "文章新增成功", alert: "大失敗！"

        

        @article = Article.new(article_params) 
        
        if @article.save
            redirect_to "/articles", notice: "文章新增成功"
        else
            # redirect_to "/articles/new", alert: "大失敗！"
            # 拿 new.html.erb
            flash[:alert] = "大失敗！"
            render :new
        end
    end

    private
    def article_params
        params.require(:article).permit(:title, :content)
    end
end
