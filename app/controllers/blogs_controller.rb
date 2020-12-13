class BlogsController < ApplicationController

  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def create
    Blog.create(blog_params)
    redirect_to blogs_path
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:id])
    if @blog.update(blog_params)
      redirect_to blogs_path, notice: "編集しました"
    else
      render 'edit'
    end
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    redirect_to blogs_path, notice:"削除しました"
  end

  private

  def blog_params
    params.require(:blog).permit(:title, :text, :start_time)
  end

end