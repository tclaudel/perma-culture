class UsersController < ApplicationController

	def index
		@users = User.all
	end

	def show
		@users = User.all
		@user = set_user
	end

	def destroy; end

	def edit
		@user = set_user
	end

	def update
		@user = set_user

		if @user.update(post_params)
			respond_to do |format|
				format.js
				format.html { redirect_to @user, notice: 'Description mise a jour.' }
			end
		else
			render :edit
		end
	end

	private
	def is_not_your_profile
		params[:id].to_i != current_user.id
	end

	def set_user
		User.find(params[:id])
	end

	def post_params
		params.require(:user).permit(:user_name, :description)
	end
end
