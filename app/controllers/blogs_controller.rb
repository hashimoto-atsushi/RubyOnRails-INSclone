class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy,]
  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def confirm
    @blog = Blog.new(blog_params)
    @blog.user_id = current_user.id
    render :new if @blog.invalid?
  end

  def create
    @blog = Blog.new(blog_params)
    @blog.user_id = current_user.id
    @mailer = current_user
    if params[:back]
      render :new
    else
      if @blog.save
        BlogMailer.blog_mail(@mailer, @blog).deliver if @blog.image?
        redirect_to blogs_path, notice: "ブログ作成しました。"
      else
        render :new
      end
    end
  end

  def destroy
    if logged_in?
      @blog.destroy
      redirect_to blogs_path, notice: "ブログを削除しました"
    end
  end

  def show
    if logged_in?
      @blog
      @favorite = current_user.favorites.find_by(blog_id: @blog.id)
      @favorite_blogs = current_user.favorite_blogs
    end
  end

  def edit
    if logged_in?
    @blog
    end
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
    params.require(:blog).permit(:title, :content, :image, :image_cache)
  end

  def set_blog
    @blog = Blog.find(params[:id])
  end

end
