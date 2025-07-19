class ArticlesController < ApplicationController
  
require './app/services/search_tracker'


def index
  @articles = if params[:query].present?
                SearchTracker.new(request.remote_ip, params[:query]).call
                Article.search_by_title(params[:query])
              else
                Article.all
              end

  render turbo_frame_request? ? { partial: "articles", locals: { articles: @articles } } : :index
end



def search_analytics
  ip_address = request.remote_ip
  @search_queries = SearchQuery.analytics(ip_address)
end

def new
  @article = Article.new
end

def create
  @article = Article.new(article_params)
  if @article.save
    redirect_to articles_path, notice: "Article was successfully created."
  else
    render :new, status: :unprocessable_entity
  end
end

private

def article_params
  params.require(:article).permit(:title, :content)
end

end
