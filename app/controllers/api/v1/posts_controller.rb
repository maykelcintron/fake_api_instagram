module Api
	module V1
		class PostsController < ApplicationController
			before_action :set_post, only: %i[show update destroy]

			def index
				@posts = Post.all
				render json: @posts
			end

			def create
				@post = Post.new(post_params)

				if @post.save
					render json: @post, status: :created
				else
					render json: @post.errors, status: :unprocessable_entity
				end
			end

			def show
				render json: @post, status: :ok
			end

			def update
				if @post.update(post_params)
					render json: @post, status: :ok
				else
					render json: @post.errors, status: :unprocessable_entity
				end
			end

			def destroy
				if @post&.destroy
					head :no_content
				else
					render json: { error: 'Post not found' }, status: :not_found
				end
			end

			private

			def post_params
				params.require(:post).permit(:title, :description, :user_id)
			end

			def set_post
				@post = Post.find_by(id: params[:id])
			end
		end
	end
end