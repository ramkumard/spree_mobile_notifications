class Spree::Admin::GcmNotification < ActiveRecord::Base
  attr_accessible :title, :content, :link, :image_name
  self.table_name = "spree_gcm_notifications"

  def image_url
    "http://s3-ap-southeast-1.amazonaws.com/st-mobile-apps/Notification/#{self.image_name}"
  end
end
