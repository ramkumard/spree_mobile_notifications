class Spree::Admin::MobileNotificationController < Spree::Admin::BaseController
  def new
    @mobile_notification = Spree::Admin::MobileNotification.new
  end

  def create
    @mobile_notification = Spree::Admin::MobileNotification.new(params[:spree_admin_mobile_notification])
    respond_to do |format|
      if @mobile_notification.save
        format.html { redirect_to :action => 'index', :alert => 'Notification was successfully created.' }
        format.json { render :json => @mobile_notification, :status => :created, :location => @mobile_notification }
      else
        format.html { render :action => "new" }
        format.json { render :json => @mobile_notification.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update

    @mobile_notification = Spree::Admin::MobileNotification.find(params[:id])
    if @mobile_notification.update_attributes(params[:spree_admin_mobile_notification])
      redirect_to :action => 'index'
      #render :text => params
    else
      render :edit
    end


  end

  def edit
    @mobile_notification = Spree::Admin::MobileNotification.find(params[:id])
  end

  def destroy
    Spree::Admin::MobileNotification.find(params[:id]).destroy
    redirect_to :action => 'new'
  end

  def index
    @mobile_notification = Spree::Admin::MobileNotification.all
    #@usernotification = Spree::Notification.all
  end

end
