class Spree::Admin::MobileNotification < ActiveRecord::Base
  attr_accessible :title, :content, :start_date, :end_date
  self.table_name = "spree_mobile_notifications"
end
