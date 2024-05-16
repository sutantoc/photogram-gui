Rails.application.routes.draw do

get("/", { :controller => "users", :action => "index"})

end
