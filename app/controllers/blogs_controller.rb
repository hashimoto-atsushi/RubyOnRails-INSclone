class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.create(title: params[:blog][:title], content: params[:blog][:content])
    redirect_to blogs_path
  end

  private
  def blog_params
    params.require(:blog).permit(:title, :content)
  end

end
