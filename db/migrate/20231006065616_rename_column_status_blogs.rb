class RenameColumnStatusBlogs < ActiveRecord::Migration[7.0]
  def change
    rename_column :blogs, :status, :is_published
    change_column_default :blogs, :is_published, false
  end
end
