class LockController < ApplicationController
  def switch
    cu.is_active = !cu.is_active
    cu.save
    render '/pages/allusers'
  end
end
