class CategoryController < ApplicationController
  layout "articles"
  in_place_edit_for :category, :name

  def index
    @categories = Category.find(:all)

    if request.get?
      respond_to do |format|
        format.html {render :templates=>'index'}
      end
    end
  end

  def edit
    @category = Category.find(params[:id])
    if request.post?
      @category.name = params[:category]['name']
      @category.save
      respond_to do |format|
        format.html {redirect_to(:controller=>'category',:action=>'index')}
      end
    end
  end

  def delete
    Category.find(params[:id]).destroy
    respond_to do |format|
      format.html {redirect_to :controller=>"category",:action=>'index'}
    end
  end

  def show
    @category = Category.find(params[:id])
  end

  def add
    @category = Category.new

    if request.post?
      @category.name=params[:category]['name']
      @category.save
      flash[:notice]="add success"
      redirect_to :action=>'index'
    else
      render :template=>'category/add'
    end
  end
end

