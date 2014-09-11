class CreateSpreeMobileNotifications < ActiveRecord::Migration
  def change
    create_table :spree_mobile_notifications do |t|
      t.text :title
      t.text :content
      t.datetime :start_date
      t.datetime :end_date
      t.timestamps
    end
  end
end
