class UsersController < ApplicationController

	def index
		@users = User.all
	end

	def show
		@user = set_user
		@category = Category.all
	end

  def destroy; end

	def edit
		@user = set_user
	end

	def update
		@user = set_user

    if @user.update(post_params)
      flash[:success] = 'Profile updated'
      redirect_to @user
    else
      render :edit
    end
  end

  private

	def set_user
		User.find(params[:id])
	end

	def post_params
      params.require(:user).permit(:user_name)
    end
end
