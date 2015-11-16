class Spree::Admin::MobileNotification < ActiveRecord::Base
  attr_accessible :title, :content, :start_date, :end_date, :image_name
  self.table_name = "spree_mobile_notifications"

  def image_url
    "http://s3-ap-southeast-1.amazonaws.com/st-mobile-apps/Notification/#{self.image_name}"
  end
end
