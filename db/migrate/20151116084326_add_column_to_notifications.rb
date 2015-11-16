class AddColumnToNotifications < ActiveRecord::Migration
  def change
  	add_column :spree_mobile_notifications, :image_name, :string
  end
end
