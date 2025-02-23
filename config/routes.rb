Rails.application.routes.draw do
  get("/", { :controller => "users", :action => "index"})
  get("/users", { :controller => "users", :action => "index"})
  

  get("/users/:path_username", { :controller => "users", :action => "show"})
  get("/add_user", { :controller => "users", :action => "add_user"})
  get("/update_user/:path_username", { :controller => "users", :action => "update_user"})


  get("/photos", { :controller => "photos", :action => "index"})
  get("/photos/:path_id", { :controller => "photos", :action => "show"})

  get("/delete_photo/:toast_id", { :controller => "photos", :action => "baii"})

  get("/insert_photo", { :controller => "photos", :action => "create"})
  get("/update_photo/:modify_id", { :controller => "photos", :action => "update"})

  get("/add_comment/:path_id", { :controller => "photos", :action => "comment"})
  
end
