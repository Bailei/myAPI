class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title
      t.string :shortDescription
      t.string :longDescription
      t.string :liveBroadcastTime
      t.string :showTitle
      t.string :channelTitle
      t.string :season
      t.string :episode
      t.string :duration
      t.string :parentalGuidance
      t.string :logo_image
      t.string :userVideoDetails
      t.string :template_image
      t.string :show
      t.string :channel
      t.string :self
      t.string :publisher
      t.string :default_image
      t.string :cell_image
      t.string :channel_subscription_status
      t.string :showId
      t.string :channelId

      t.timestamps null: false
    end
  end
end
