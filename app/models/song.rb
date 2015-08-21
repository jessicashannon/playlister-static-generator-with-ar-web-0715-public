class Song < ActiveRecord::Base
  include Slugifiable
  belongs_to :genre
  belongs_to :artist
end
