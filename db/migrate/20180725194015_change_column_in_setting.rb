class ChangeColumnInSetting < ActiveRecord::Migration[5.1]
  def change
  	rename_column :settings, :type, :setting_name
  end
end
