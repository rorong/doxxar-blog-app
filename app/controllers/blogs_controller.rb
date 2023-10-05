class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
  end
  def show
    @blog = Blog.friendly.find(params[:id])
  end
  private 

  def blogs_params
    params.requir(:blogs).permit(:title,:content,:status,:author,:user_id)
  end

end
