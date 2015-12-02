class Spree::Admin::AndroidDevice < ActiveRecord::Base
  attr_accessible :registration_id
  self.table_name = "spree_android_device"
end