Rails.application.routes.draw do
  get("/users", { :controller => "users", :action => "index"})

  get("/users/:path_username", { :controller => "users", :action => "show"})


  get("/photos", { :controller => "photos", :action => "index"})
  get("/photos/:photo_details", { :controller => "photos", :action => "show"})

end
