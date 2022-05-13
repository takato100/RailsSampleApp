## controllers/sessions_controller.rb
## after the access of the twitter api. "create" and "destroy"
def create
    unless request.env['omniauth.auth'][:uid]
        flash[:danger] = "api integration failed"
        redirect_to root_url
    end

    user_data = request.env['omniauth.auth']
    user = User.find_by(uid: user_data[:uid])

    ## if user data exist -> only login
    if user
        log_in(user)
        flash[:success] = 'logged in'
        redirect_to root_url
    ## else -> make an new User and login
    else
        new_user = User.new(
            uid: user_data[:uid],
            nickname: user_data[:info][:nickname],
            name: user_data[:info][:name],
            image: user_data[:info][:image]
        )
        if new_user.save
            log_in(new_user)
            flash[:success] = 'user registration succeed'
        else
            flash[:danger] = 'unexpected error'
        end
        redirect_to root_url
    end
end

## logout
def destroy
    log_out if logged_in?
    flash[:succeed] = 'logged out'
    redirect_to root_url
end