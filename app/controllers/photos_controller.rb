class PhotosController < ApplicationController
  def index
    all_photos = Photo.all
    @list_of_photos = all_photos.order({ :created_at => :desc })

    render({ :template => "/photo_templates/index" })
  end

  def create
    p = Photo.new
    p.image = params.fetch("image_input")
    p.caption = params.fetch("caption_input")
    p.owner_id = params.fetch("owner_id_input")
    p.save

    redirect_to("/photos")
  end
end
