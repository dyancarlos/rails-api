module Api
	class UsersController < ApplicationController
		before_action :fetch_user, only: [:update, :destroy]

		def index
			@users = User.all

			render json: @users
		end

		def create
			@user = User.new(user_params)

			if @user.save
				render json: @user
      else
        render json: @user.errors.messages
			end
		end

		def update
			if @user.update_attributes(user_params)
				render json: @user
      else
        render json: @user.errors.messages
			end
		end

		def destroy
			render json: { status: :ok } if @user.destroy
		end

		private

  		def fetch_user
  			@user = User.find(params[:id])
  		end

  		def user_params
  			params.require(:user).permit(:name, :job)
  		end
	end
end
