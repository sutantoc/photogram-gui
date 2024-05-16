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

    redirect_to("/photos/#{p.id}")
  end

  def show
    p_id = params.fetch("photo_id")
    matching_photos = Photo.where({ :id => p_id})
    @the_photo = matching_photos.at(0)

    all_comments = @the_photo.comments.all
    @list_of_comments = all_comments.order({ :created_at => :desc })

    render({ :template => "photo_templates/show" })
  end

  def modify
    p_id = params.fetch("photo_id")
    matching_photos = Photo.where({ :id => p_id})
    the_photo = matching_photos.at(0)

    the_photo.image = params.fetch("new_image")
    the_photo.caption = params.fetch("new_caption")
    the_photo.save

    redirect_to("/photos/#{the_photo.id}")
  end

  def delete
    p_id = params.fetch("photo_id")
    matching_photos = Photo.where({ :id => p_id})
    the_photo = matching_photos.at(0)

    the_photo.destroy
    redirect_to("/photos")
  end

  def comment
    c = Comment.new
    c.photo_id = params.fetch("photo_id_input")
    c.body = params.fetch("comment_input")
    c.author_id = params.fetch("author_id_input")
    c.save

    redirect_to("/photos/#{c.photo_id}")
  end
end
