class ArticlesController < ApplicationController
	include ArticlesHelper
	def index
		@articles = Article.all
	end

	def show
		@article = Article.find(params[:id])
	end

	def new
		@article = Article.new
	end

	def create
		# OLD WAY --@article = Article.new
		# OLD WAY -- @article.title = params[:article][:title]
		# OLD WAY -- @article.body = params[:article][:body]

		# OLD WAY 2 -- @article = Article.new(title: params[:article][:title], body: params[:article][:body])
		
		@article = Article.new(article_params)
		@article.save
		flash.notice = "Article '#{@article.title}' created!"
		redirect_to article_path(@article)
	end

	def edit
		@article = Article.find(params[:id])
	end

	def update
		@article = Article.find(params[:id])
		@article.update(article_params)
		flash.notice = "Article '#{@article.title}' updated!"
		redirect_to articles_path(@article)
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy
		flash.notice = "Article '#{@article.title}' destroyed!"
		redirect_to articles_path
	end
end
