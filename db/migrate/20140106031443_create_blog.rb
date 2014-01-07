class CreateBlog < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :title, :null => false
      t.text :content
      t.integer :user_id
      t.timestamps
    end
  end
end
