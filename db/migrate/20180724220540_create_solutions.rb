class CreateSolutions < ActiveRecord::Migration[5.1]
  def change
    create_table :solutions do |t|
      t.integer :section
      t.string :title
      t.text :body
      t.integer :author
      t.string :tags

      t.timestamps
    end
  end
end
