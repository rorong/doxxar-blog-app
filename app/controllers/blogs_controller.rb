class BlogsController < ApplicationController
  def index
    @blogs = Blog.published.order(created_at: :desc).page(params[:page])
  end
  def show
    @blog = Blog.friendly.find(params[:id])
  end
end
