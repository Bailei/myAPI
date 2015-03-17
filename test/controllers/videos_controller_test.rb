require 'test_helper'

class VideosControllerTest < ActionController::TestCase
  setup do
    @video = videos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:videos)
  end

  test "should create video" do
    assert_difference('Video.count') do
      post :create, video: { cell_image: @video.cell_image, channel: @video.channel, channelId: @video.channelId, channelTitle: @video.channelTitle, channel_subscription_status: @video.channel_subscription_status, default_image: @video.default_image, duration: @video.duration, episode: @video.episode, liveBroadcastTime: @video.liveBroadcastTime, logo_image: @video.logo_image, longDescription: @video.longDescription, parentalGuidance: @video.parentalGuidance, publisher: @video.publisher, season: @video.season, self: @video.self, shortDescription: @video.shortDescription, show: @video.show, showId: @video.showId, showTitle: @video.showTitle, template_image: @video.template_image, title: @video.title, userVideoDetails: @video.userVideoDetails }
    end

    assert_response 201
  end

  test "should show video" do
    get :show, id: @video
    assert_response :success
  end

  test "should update video" do
    put :update, id: @video, video: { cell_image: @video.cell_image, channel: @video.channel, channelId: @video.channelId, channelTitle: @video.channelTitle, channel_subscription_status: @video.channel_subscription_status, default_image: @video.default_image, duration: @video.duration, episode: @video.episode, liveBroadcastTime: @video.liveBroadcastTime, logo_image: @video.logo_image, longDescription: @video.longDescription, parentalGuidance: @video.parentalGuidance, publisher: @video.publisher, season: @video.season, self: @video.self, shortDescription: @video.shortDescription, show: @video.show, showId: @video.showId, showTitle: @video.showTitle, template_image: @video.template_image, title: @video.title, userVideoDetails: @video.userVideoDetails }
    assert_response 204
  end

  test "should destroy video" do
    assert_difference('Video.count', -1) do
      delete :destroy, id: @video
    end

    assert_response 204
  end
end
