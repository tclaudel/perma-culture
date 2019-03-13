# frozen_string_literal: true

class PostPicturesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @post.post_pictures.attach(params[:post_pictures])
    respond_to do |format|
      format.html { redirect_to(edit_post_path(@post)) }
      format.js
    end
  end
end
