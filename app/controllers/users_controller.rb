class UsersController < ApplicationController
  def index
    matching_users = User.all

    @list_of_users = matching_users.order({ :username => :asc})

    render({ :template => "user_templates/index.html.erb"})
  end

  def show
    # Parameters {"path_username"=>"matt"}

    url_username = params.fetch("path_username")

    matching_usernames = User.where({ :username => url_username})

    @the_user = matching_usernames.first

    #if the_user == nil
     # redirect_to ("/404")
    #else 
    render({ :template => "user_templates/show.html.erb"})
  end

  def add_user
    #  Parameters: {"query_username"=>"Paulie"}
    new_user = User.new
    new_user.username = params.fetch("query_username")

    new_user.save

    next_url = "/users/" + new_user.username.to_s

    redirect_to(next_url)
    #render({ :template => "user_templates/add_user.html.erb"})
  end

  def update_user
    # Parameters: {"query_username"=>"MikeHe", "path_username"=>"Mikey"}
    orig_username = params.fetch("path_username")
    new_username = params.fetch("query_username")
    
    matching_user = User.where({ :username => orig_username})

    the_user = matching_user.at(0)

    the_user.username = new_username

    the_user.save

    #render({ :template => "user_templates/update_user.html.erb" })

    next_url = "/users/" + the_user.username.to_s

    redirect_to(next_url)
  end

end
