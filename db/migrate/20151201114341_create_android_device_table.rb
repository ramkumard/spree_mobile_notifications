class CreateAndroidDeviceTable < ActiveRecord::Migration
 def change
    create_table :spree_android_device do |t|
      t.text :registration_id
      t.string :email
      t.string :phone
      t.string :location
      t.string :name
      t.string :device_name
      t.timestamps
   	end
  end
end
