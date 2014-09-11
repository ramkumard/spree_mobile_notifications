Deface::Override.new(
            :name => "mobile_notifications",
            :virtual_path => "spree/layouts/admin",
            :insert_bottom => "[data-hook='admin_tabs'], #admin_tabs[data-hook]",
            :text => "<%= tab :mobile_notifications,  :url => '/admin/mobile_notification', :icon => 'icon-comment' %>")
