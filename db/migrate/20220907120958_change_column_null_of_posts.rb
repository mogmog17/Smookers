class ChangeColumnNullOfPosts < ActiveRecord::Migration[6.1]
  def change
    change_column_null :posts, :star, false, 0
  end
end
