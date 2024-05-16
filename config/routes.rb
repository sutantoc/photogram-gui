Rails.application.routes.draw do

get("/", { :controller => "users", :action => "index"})

get("/users", { :controller => "users", :action => "index"})
post("/add_user", { :controller => "users", :action => "create"})

end
