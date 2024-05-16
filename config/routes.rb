Rails.application.routes.draw do

get("/", { :controller => "users", :action => "index"})

get("/users", { :controller => "users", :action => "index"})
post("/add_user", { :controller => "users", :action => "create"})
get("/users/:username", { :controller => "users", :action => "show"})
post("/modify_user/:user_id", { :controller => "users", :action => "modify" })

end
