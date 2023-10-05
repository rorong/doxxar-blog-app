class AddColumnToBlog < ActiveRecord::Migration[7.0]
  def change
    add_column :blogs, :heading, :string
  end
end
