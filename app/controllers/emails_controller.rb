class EmailsController < ApplicationController
  prepend_before_filter :authenticate_user!
  layout 'admin'
  expose(:shop){ current_user.shop }
  expose(:users){ shop.users }
  expose(:emails){ shop.emails }
  expose(:email)
  expose(:subscribes){ shop.subscribes }
  expose(:subscribe)

  def index
  end

  def update
    email.save
    redirect_to admin_notifications_path , notice: notice_msg
  end

  def follow
    sub = params[:subscribe]
    address = params[:address]
    if sub == 'email'
      subscribe.address = address
      subscribe.save
    else
      subscribe.user_id = sub
      subscribe.save
    end
  end

  def unfollow
  end
end
