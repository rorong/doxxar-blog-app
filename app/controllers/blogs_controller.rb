class BlogsController < ApplicationController
  def index
    @blogs = Blog.published.order(created_at: :desc).page(params[:page])
    @blogs = @blogs.where(language: params[:language]) if params[:language].present?
    respond_to do |format|
      format.html
      format.js
    end
  end
  def show
    @blog = Blog.friendly.find(params[:id])
  end
end
