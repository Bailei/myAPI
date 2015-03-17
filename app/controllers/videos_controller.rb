require 'json'

class VideosController < ApplicationController
  include ActionController::MimeResponds
  include ActionController::Helpers
  include ActionController::Cookies
  include ActionController::ImplicitRender
  before_action :set_video, only: [:show, :update, :destroy]

  # GET /videos
  # GET /videos.json
  def index
    @videos = Video.all
    
    # Search
    @videos = @videos.search(params[:q]) if params[:q]

    # Order by
    @videos = @videos.order(params[:order].gsub(':', ' ')) if params[:order]

    # Pagination
    if (params[:offset] && params[:limit])
      @videos = @videos.page(1).per(params[:limit]).padding(params[:offset])
    elsif params[:page]
      @videos = @videos.page(params[:page]).per(6)
    end
    
    # render json: @videos  
    render text: JSON.generate(convertVideo(@videos))
    # respond_to do |format|
    #   format.json {render json: @videos}
    #   format.xml {render xml: @videos }
    # end
  end

  # GET /videos/1
  # GET /videos/1.json
  def show
    render json: @video
  end

  # POST /videos
  # POST /videos.json
  def create
    @video = Video.new(video_params)

    if @video.save
      render json: @video, status: :created, location: @video
    else
      render json: @video.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /videos/1
  # PATCH/PUT /videos/1.json
  def update
    @video = Video.find(params[:id])

    if @video.update(video_params)
      head :no_content
    else
      render json: @video.errors, status: :unprocessable_entity
    end
  end

  # DELETE /videos/1
  # DELETE /videos/1.json
  def destroy
    @video.destroy

    head :no_content
  end
  
  def convertVideo(v)
    videos = []
    v.each do |video|
      videos.push({
        :type => "video",
        :id => 1934 - video.id + 1,
        :title => video.title,
        :sortDescription => video.shortDescription,
        :longDescription => video.longDescription,
        :liveBroadcastTime => video.liveBroadcastTime,
        :showTitle => video.showTitle,
        :channelTitle => video.channelTitle,
        :season => video.season,
        :episode => video.episode,
        :duration => video.duration,
        :parentalGuidance => video.parentalGuidance,
        :link => {
          :logo_image => video.logo_image,
          :userVideoDetails => video.userVideoDetails,
          :template_image => video.template_image,
          :show => video.show,
          :channel => video.channel,
          :self => video.self,
          :publisher => video.publisher,
          :default_image => video.default_image,
          :cell_image => video.cell_image,
          :channel_subscription_status => video.channel_subscription_status
        },
        :duration => video.duration,
        :parentalGuidance => video.parentalGuidance
      })
    end
    return videos
  end

  private

    def set_video
      @video = Video.find(params[:id])
    end

    def video_params
      params.require(:video).permit(:name)
    end
end
