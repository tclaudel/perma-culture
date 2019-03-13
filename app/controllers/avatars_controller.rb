# frozen_string_literal: true

class AvatarsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @user.avatar.attach(params[:avatar])
    respond_to do |format|
      format.html { redirect_to(edit_user_path(@user)) }
      format.js
    end
  end
end
