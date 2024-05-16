Rails.application.routes.draw do

get("/", { :controller => "users", :action => "index"})

get("/users", { :controller => "users", :action => "index"})
post("/add_user", { :controller => "users", :action => "create"})
get("/users/:username", { :controller => "users", :action => "show"})
post("/modify_user/:user_id", { :controller => "users", :action => "modify" })

get("/photos", { :controller => "photos", :action => "index"})
post("/post_photo", { :controller => "photos", :action => "create" })
get("/photos/:photo_id", { :controller => "photos", :action => "show" })
post("/update_photo/:photo_id", { :controller => "photos", :action => "modify" })
get("/delete_photo/:photo_id", { :controller => "photos", :action => "delete" })

end
