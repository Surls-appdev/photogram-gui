class PhotosController < ApplicationController

  def index

    matching_photos = Photo.all

    @list_of_photos = matching_photos.order({ :created_at => :desc })

    render({ :template => "photo_templates/index.html.erb"})
  end

  def show
    # Parameters: {"path_id"=>"777"}
    url_id = params.fetch("path_id")
    
    matching_photos = Photo.where({ :id => url_id })

    @the_photo = matching_photos.at(0)

    render({ :template => "photo_templates/show.html.erb"})
  end

  def baii
    # Parameters: {"toast_id"=>"686"}
    the_id = params.fetch("toast_id")

    matching_photos = Photo.where({ :id => the_id })

    the_photo = matching_photos.at(0)

    the_photo.destroy

    # render({ :template => "photo_templates/baii.html.erb"})

    redirect_to("/photos")
  end

  def create
    # Parameters: {"query_image"=>"https://www.chicagobooth.edu/-/media/project/chicago-booth/why-booth/a-global-footprint/a-dynamic-influence-in-europose-the-middle-east-and-africa/chicago-booth-london-building-entrance.jpg?cx=0.58&cy=0.72&cw=940&ch=749&hash=BA83D00D9BE1FDAA565CB2B6B949C1D0", "query_caption"=>"Chicago Booth", "query_owner_id"=>"117"}

  input_image = params.fetch("query_image")
  input_caption = params.fetch("query_caption")
  owner_id = params.fetch("query_owner_id")

  a_new_photo = Photo.new
  a_new_photo.image = input_image
  a_new_photo.caption = input_caption
  a_new_photo.owner_id = owner_id

  a_new_photo.save

    # render({ :template => "photo_templates/create.html.erb"})

    next_url = "/photos/" + a_new_photo.id.to_s


    redirect_to(next_url)
  end

  def update
    # Parameters: {"query_image"=>"https://www.chicagobooth.edu/-/media/project/chicago-booth/why-booth/a-global-footprint/a-dynamic-influence-in-europose-the-middle-east-and-africa/chicago-booth-london-building-entrance.jpg?cx=0.58&cy=0.72&cw=940&ch=749&hash=BA83D00D9BE1FDAA565CB2B6B949C1D0", "query_caption"=>"asdfASD", "modify_id"=>"952"}

    the_id = params.fetch("modify_id")

    matching_photos = Photo.where({ :id => the_id})

    the_photo = matching_photos.at(0)


    input_image = params.fetch("query_image")
    input_caption = params.fetch("query_caption")

    the_photo.image = input_image
    the_photo.caption = input_caption
    
    the_photo.save
       
    # render({ :template => "photo_templates/update.html.erb"})

    next_url = "/photos/" + the_photo.id.to_s

    redirect_to(next_url)

  end

  def comment
    # Parameters: {"query_photo"=>"951", "query_author"=>"Matt", "query_comment"=>"Nice campus", "path_id"=>"951"}

  input_comment = params.fetch("query_comment")
  input_author = params.fetch("query_author")
  photo_id = params.fetch("query_photo")

    a_new_comment = Comment.new
    a_new_comment.body = input_comment
    a_new_comment.author_id = input_author
    a_new_comment.photo_id = photo_id

    a_new_comment.save

    # render({ :template => "photo_templates/comment.html.erb"})
    # redirect
    next_url = "/photos/" + photo_id

    redirect_to(next_url)
  end

end
