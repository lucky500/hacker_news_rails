class CreateLinks < ActiveRecord::Migration[5.1]
  def change
    create_table :links do |t|
      t.column :title, :string
      t.column :description, :text
      t.column :url, :string
      t.column :user_id, :integer
      
      t.timestamps
    end
  end
end
