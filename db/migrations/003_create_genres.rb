class CreateGenres < ActiveRecord::Migration
  def change
    create_table :genres do |t|
      t.string :name
      # t.has_many :songs
    end
  end
end
