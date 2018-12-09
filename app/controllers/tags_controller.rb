class TagsController < ApplicationController
	before_action :require_login, only: [ :destroy ]

	def index
		@tags = Tag.all
	end
	def show
		@tag = Tag.find(params[:id])
	end
	def edit
		@tag = Tag.find(params[:id])
	end

	def destroy
		@tag = Tag.find(params[:id])
		@tag.destroy
		flash.notice = "Tag '#{@tag.name}' destroyed!"
		redirect_to articles_path
	end
end
