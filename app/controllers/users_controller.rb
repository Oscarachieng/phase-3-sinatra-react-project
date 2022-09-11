class UsersController < ApplicationController

    #sing up

    post "/signup" 
       user = User.new
       if user.name.blank? || user.email_address.blank? || user.password.blank? || user.location.blank || user.find_by_email(params[:email]) || user.find_by_name(params[:name])
         redirect '/signup'
       else
         user.save
         session[:user_id] = user.id
         redirect '/'
       end

    end


    #sign in
    get '/login' do 
        erb:"users/login"
    end


    post "/login" do 
        user = User.find_by_name(params[:name])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect '/'
        else
            flash[:error] ="Invalid login"
        end
    end

    #logout

    get '/logout' do
        session.clear
        redirect "/login"
    end

end