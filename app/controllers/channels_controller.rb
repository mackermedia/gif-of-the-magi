class ChannelsController < ApplicationController

  def show
    @channel  = Channel.find_or_create_by_name(params[:channel_token])
    @gif      = Gif.where(:channel_id => @channel.id).order(:created_at => :desc).first
  end

end
