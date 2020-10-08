class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update]
  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      redirect_to blogs_path, notice: "ブログ作成しました。"
    else
      render :new
    end
  end

  def destroy
    @blog.destroy
    redirect_to blogs_path
  end

  def show
    @blog
  end

  def edit
    @blog
  end

  def update
    @blog
    if @blog.update(blog_params)
      redirect_to blogs_path, notice: "編集されました"
    else
      render :edit
    end
  end


  private
  def blog_params
    params.require(:blog).permit(:title, :content, :image)
  end

  def set_blog
    @blog = Blog.find(params[:id])
  end

end
