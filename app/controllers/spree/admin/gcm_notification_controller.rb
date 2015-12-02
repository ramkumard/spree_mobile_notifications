class Spree::Admin::GcmNotificationController < Spree::Admin::BaseController
  require 'gcm'

	def new
    @gcm_notification = Spree::Admin::GcmNotification.new
  end

  def create
    @gcm_notification = Spree::Admin::GcmNotification.new(params[:spree_admin_gcm_notification])
    respond_to do |format|
      if @gcm_notification.save
        format.html { redirect_to :action => 'index', :alert => 'Notification was successfully created.' }
        format.json { render :json => @gcm_notification, :status => :created, :location => @gcm_notification }
      else
        format.html { render :action => "new" }
        format.json { render :json => @gcm_notification.errors, :status => :unprocessable_entity }
      end
    end
  end


  def update
    @gcm_notification = Spree::Admin::GcmNotification.find(params[:id])
    if @gcm_notification.update_attributes(params[:spree_admin_gcm_notification])
      redirect_to :action => 'index'
      #render :text => params
    else
      render :edit
    end
  end

  def edit
    @gcm_notification = Spree::Admin::GcmNotification.find(params[:id])
  end

  def destroy
    Spree::Admin::GcmNotification.find(params[:id]).destroy
    redirect_to :action => 'new'
  end

  def index
    @gcm_notification = Spree::Admin::GcmNotification.all
    #@usernotification = Spree::Notification.all
  end

  def notify_user
    Spree::Admin::AndroidDevice.all.map(&:registration_id).each_slice(500) do | batch |
      gcm = GCM.new(::CUSTOM_PREFERENCE.get(:gcm_key))
      registration_ids = batch
      data = Spree::Admin::GcmNotification.find_by_id(params[:id])
      if data
        message = Hash.new()
        message[:data] = Hash.new()
        message[:data][:id] = data.id
        message[:data][:title] = data.title
        message[:data][:message] = data.content
        message[:data][:path] = data.link
        message[:data][:image] = data.image_url
        gcm.send(registration_ids, message)
      end
    end
    redirect_to :action => 'index', :alert => 'Notification was successfully created.'
  end
end
