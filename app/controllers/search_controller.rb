class SearchController < ApplicationController
  before_action :authenticate_user!
  respond_to :json
  def search
    search = Search::ShopSense.new
    #search = Search::Semantics.new
    filters = {}
    filters[:price] = params[:price] if params[:price]
    filters[:color] = params[:color] if params[:color]
    filters[:brands] = params[:brands] if params[:brands]
    offset = params[:offset] || 0
    limit = params[:limit] || 10
    render :json => search.search(params[:q], filters,offset, limit)
  end

  def brands
    search = Search::ShopSense.new
    render :json => search.get_brands(params[:q])
  end

  def retailers
    search = Search::ShopSense.new
    render :json => search.get_brands(params[:q])
  end
end
