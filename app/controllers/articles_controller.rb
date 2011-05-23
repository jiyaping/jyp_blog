class ArticlesController < ApplicationController
  # GET /articles
  # GET /articles.xml
  def index
    @articles = Article.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @articles }
    end
  end

  # GET /articles/1
  # GET /articles/1.xml
  def show
    @article = Article.find(params[:id])
    @comments = @article.comments
    @article.view_times = @article.view_times+1
    @article.save

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @article }
    end
  end

  # GET /articles/new
  # GET /articles/new.xml
  def new
    @article = Article.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @article }
    end
  end

  # GET /articles/1/edit
  def edit
    @article = Article.find(params[:id])
  end

  # POST /articles
  # POST /articles.xml
  def create
    #render :text=>params[:tags].inspect
    #render :text=>tags_object(params[:tags])[0].name
    @article = Article.new(params[:article])
    @article.tags = tags_object(params[:tags])

    respond_to do |format|
      if @article.save
        flash[:notice] = 'Article was successfully created.'
        format.html { redirect_to(@article) }
        format.xml  { render :xml => @article, :status => :created, :location => @article }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @article.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /articles/1
  # PUT /articles/1.xml
  def update
    @article = Article.find(params[:id])
    @article.tags = tags_object(params[:tags])

    respond_to do |format|
      if @article.update_attributes(params[:article])
        flash[:notice] = 'Article was successfully updated.'
        format.html { redirect_to(@article) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @article.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.xml
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    respond_to do |format|
      format.html { redirect_to(articles_url) }
      format.xml  { head :ok }
    end
  end

  def add_comment
    @comment = Comment.new(params[:comment])
    if @comment.save
      flash[:notice]="success add comment"
      redirect_to(:action=>"show",:id=>params[:comment][:article_id])
    else
      flash[:errors]="some errors came out"
    end
  end

  def show_same_category
    @articles = Category.find(params[:id]).articles
    render :template=>"articles/index"
  end

  private
  def tags_object(tags)
    tags=tags.split(",")
    result = []
    tags.each do |t|
      result<<Tag.get_tag_or_new_it(t)
    end
    result
  end
end

