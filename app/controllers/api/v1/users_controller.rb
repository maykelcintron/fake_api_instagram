module Api
  module V1
    class UsersController < ApplicationController
      before_action :set_user, only: %i[show update]

      def index
        @users = User.all
        render json: @users
      end

      def create
        @user = User.new(user_params)

        if @user.save
          render json: @user, status: :created
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      end

      def show
        render json: @user, status: :ok
      end

      def update
        if @user.update(user_params)
          render json: @user, status: :ok
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      end

      private
        def user_params
          params.require(:user).permit(:name, :lastname, :username, :email)
        end

        def set_user
          @user = User.find_by(id: params[:id])
        end
    end
  end
end