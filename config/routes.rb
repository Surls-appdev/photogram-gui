Rails.application.routes.draw do
  get("/users", { :controller => "users", :action => "index"})

  get("/users/:id", { :controller => "users", :action => "show"})

end
