class UsersController < ApplicationController
  def toggle_active
    @User = User.find(params[:id])
    @User.update_attribute(:is_active, !@User.is_active)
    puts '1234567890'
    redirect_to '/pages/allusers'
  end
end
