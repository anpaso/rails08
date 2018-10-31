class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :topic, counter_cache: :likes_count
end
