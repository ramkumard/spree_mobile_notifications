class Spree::Admin::AndroidDevice < ActiveRecord::Base
  attr_accessible :registration_id,:email,:phone,:location,:name,:device_name
  self.table_name = "spree_android_device"
end