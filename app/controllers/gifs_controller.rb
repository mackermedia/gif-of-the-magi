class GifsController < ApplicationController
  respond_to :html, :json

  def new
    @gif = Gif.new

    respond_to do |format|
      format.html
      format.json { render :json => nil }
    end
  end

  def create
    @gif = Gif.new(gif_params)

    if @gif.save
      render :json => @gif, :status => 201, :content_type => "application/json"
    else
      render :json => @gif.errors, :status => 422
    end
  end

  def index
    @gif = Gif.last

    respond_to do |format|
      format.html
      format.json { render :json => @gif, :status => 200, :content_type => "application/json" }
    end
  end

  private

  def gif_params
    params.require(:gif).permit(:url)
  end

end
