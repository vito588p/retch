class ArticlesController < ApplicationController
    # rescue_from ActiveRecord::RecordNotFound, with: :not_found  #拯救整個 controller，再移去ArticlesController
    before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
    before_action :set_article, only: [:show]  #正面表述
    #before_action :set_article, except: [:index, :new, :create]         #反面表述
    before_action :set_user_article, only: [:edit, :update, :destroy]
    
    def index
        @articles = Article.order({id: :desc})
    end

    def show
        @Comment = Comment.new
        
        #RecordNotFound Exception, 可搜尋格式不同 只能id
        #@article = Article.find(params[:id])           
        
        # @article = Article.find_by(id: params[:id])    #nil ,給find_by! 變成 RecordNotFound Exception  # 找一筆資料用find_by, in SQL 多了 LIMIT
        # @article = Article.where(id: 2)      #[] , 拿回來的東西都是陣列                        # 找多筆資料用where
        # render html: @article.title #交給 view 做

        # 以下再整包去拯救整個 controllor 第2行
        # rescue  ActiveRecord::RecordNotFound #錯誤訊息
        #     not_found   # 繼承至 application_controller.rb
    end



    def new
        #實體變數
        @article = Article.new
    end

    def create
        
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
        
        @article = current_user.articles.new(article_params) 
        
        if @article.save
            redirect_to root_path, notice: "文章新增成功"
        else
            # redirect_to "/articles/new", alert: "大失敗！"
            # 拿 new.html.erb
            render :new
        end
    end

    def edit
        #@article = Article.find(params[:id])  
    end

    def update
        #@article = Article.find(params[:id])

        if @article.update(article_params)
            redirect_to articles_path, notice: "更新成功"
        else
            render :edit
        end
    end

    def destroy
        #@article = Article.find(params[:id])
        @article.destroy
        redirect_to articles_path, notice: "刪除成功"
    end

    
    private  
    #沒有要公開的都是 private, 沒有要給外面的人用， 可以想像預設是 private ， 要用就公開

    # 加強版 params 無論你用符號 或 字串 都拿得到
    # render html: params[:title] 
    def article_params
        params.require(:article).permit(:title, :content, :sub_title)
    end

    def set_article
        @article = Article.find(params[:id])
    end

    def set_user_article
        @article = current_user.articles.find(params[:id])
    end
end
