class GifsController < ApplicationController
  respond_to :json

  def create
    @gif = Gif.new(gif_params.merge(:channel_id => channel.id))

    if @gif.save
      render :json => @gif.url, :status => 201, :content_type => "application/json"
    else
      render :json => @gif.errors, :status => 422
    end
  end

  def index
    @gif = existing_gif || default_gif

    render :json => @gif.url, :status => 200, :content_type => "application/json"
  end

  private

  def gif_params
    params.require(:gif).permit(:url)
  end

  def channel
    @channel ||= Channel.find_by_name(params[:channel_token])
  end

  def existing_gif
    Gif.where(:channel_id => channel.id).order(:created_at => :desc).first
  end

  def default_gif
    Gif.new(:url => 'http://i.imgur.com/Npizs.gif')
  end

end
