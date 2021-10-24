class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.integer :book_id
      t.text :opinion
      t.integer :user_id

      t.timestamps
    end
  end
end
