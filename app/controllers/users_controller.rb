class UsersController < ApplicationController
  def index
    all_users = User.all
    @list_of_users = all_users.order({ :created_at => :desc })

    render({ :template => "/user_templates/index" })
  end
end
