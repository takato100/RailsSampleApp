# use these functions both in the view, controller of Sessions-controller

def log_in(user)
   session[:uid] = user.id
end

def current_user
  if session[:uid]
    @current_user ||= User.find_by(uid: session[:uid])
  end
end

def logged_in?
  ## current_user = nil -> false
  !current_user.nil?
end

def log_out
  session.delete(:uid)
  @current_user = nil
end




