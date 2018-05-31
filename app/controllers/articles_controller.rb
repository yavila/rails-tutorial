class ArticlesController < ApplicationController
	http_basic_authenticate_with name: "yami", password: "demo", except: [:index, :show]


	def index
		@articles = Article.all
	end

	def show
		@article = Article.find(params[:id])
	end
	def new 
		@article = Article.new
	end

	def edit 
		@article = Article.find(params[:id])
	end

	def create
		@article = Article.new(article_params)

		if @article.save
			redirect_to @article
		else 
			# @article object is passed back to new template
			# rendering is done in same request as form submission (unlike redirect_to which tells browser to issue another req)
			render 'new' 
		end
	end

	def update 
		@article = Article.find(params[:id])
		# to partially update article could do: @article.update(title: 'A new title')
		if @article.update(article_params)
			redirect_to @article 
		else 
			render 'edit'
		end
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy

		# redirec to index
		redirect_to articles_path
	end

	private
		def article_params
			params.require(:article).permit(:title, :text)
		end
end
