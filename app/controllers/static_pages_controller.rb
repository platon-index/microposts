class StaticPagesController < ApplicationController
 
  def home
    if logged_in?
    @micropost = current_user.microposts.build
    @feed_items = current_user.feed_items.includes(:user).page(params[:page])
    @microposts_items = Micropost.page(params[:page]).reverse_order
    end
  end
  
 
  
end
