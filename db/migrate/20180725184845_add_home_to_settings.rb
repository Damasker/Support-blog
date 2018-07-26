class AddHomeToSettings < ActiveRecord::Migration[5.1]
  def change
    add_column :settings, :homepage, :text
  end
end
