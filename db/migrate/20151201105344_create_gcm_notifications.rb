class CreateGcmNotifications < ActiveRecord::Migration
 def change
    create_table :spree_gcm_notifications do |t|
      t.text :title
      t.text :content
      t.text :image_name
      t.text :link
      t.boolean :active
      t.timestamps
   	end
  end
end
