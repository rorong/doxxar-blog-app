class AddBannerImageToBlogs < ActiveRecord::Migration[7.0]
  def change
    add_column :blogs, :banner_image, :string
  end
end
