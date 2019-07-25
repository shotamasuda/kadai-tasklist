module SessionsHelper
  #現在ログインしているユーザを取得するメソッド
  def current_user
    # if @current_user
    #     return @current_user
    # else
    #     @current_user = User.find_by(id: session[:user_id])
    #     return @current_user
    # end　の省略形
    @current_user ||= User.find_by(id: session[:user_id])
  end

  # ユーザがログインしていれば true を返し、ログインしていなければ false を返します
  def logged_in?
    !!current_user
  end
end
