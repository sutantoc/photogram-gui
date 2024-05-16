class UsersController < ApplicationController
  def index
    all_users = User.all
    @list_of_users = all_users.order({ :created_at => :desc })

    render({ :template => "/user_templates/index" })
  end

  def create
    u = User.new
    u.username = params.fetch("input_username")
    u.save

    redirect_to("/users")
  end

  def show
    the_username = params.fetch("username")
    matching_users = User.where({ :username => the_username})
    @the_user = matching_users.at(0)

    user_photos = @the_user.own_photos.all
    @list_of_photos = user_photos.order({ :posted => :desc })
    
    render({ :template => "user_templates/show" })
  end
end
