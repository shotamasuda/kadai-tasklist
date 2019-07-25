# 全ての Controller が ApplicationController を継承しているからです。
class ApplicationController < ActionController::Base
  include SessionsHelper

  private

#   unless は if の反対です。
  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
  
  def counts(user)
    @count_tasks = user.tasks.count
  end
end