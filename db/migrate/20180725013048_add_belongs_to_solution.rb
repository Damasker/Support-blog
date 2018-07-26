class AddBelongsToSolution < ActiveRecord::Migration[5.1]
  def change
    add_reference :solutions, :user, foreign_key: true
  end
end
