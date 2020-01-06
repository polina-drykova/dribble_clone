class Shot < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  mount_uploader :user_shot, UserShotUploader
  is_impressionable counter_cache: true
end
