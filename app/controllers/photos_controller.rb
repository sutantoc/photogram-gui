class PhotosController < ApplicationController
  def index
    all_photos = Photo.all
    @list_of_photos = all_photos.order({ :created_at => :desc })

    render({ :template => "/photo_templates/index" })
  end

end
