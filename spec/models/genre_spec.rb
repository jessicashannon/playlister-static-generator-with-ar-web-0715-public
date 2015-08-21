require_relative '../spec_helper'

describe 'Genre' do
  before do
    @genre = Genre.create(name: "Hip Hop")
    @classical = Genre.create(name: "Classical")
  end

  after do
    clean_database
  end

  it 'has a name' do
    expect(Genre.where(name: "Hip Hop").first).to eq(@genre)
  end

  it "has a slugified name" do
    expect(@genre.to_slug).to eq("hip-hop")
    expect(@classical.to_slug).to eq("classical")
  end

  it 'has many songs' do
    @genre.songs << Song.create(name: "Something By That Person Who Sings Stuff")
    @genre.save

    found_song = Song.find_by(name: "Something By That Person Who Sings Stuff")
    expect(found_song.genre).to eq(@genre)
  end

  it 'is also associated with an artist' do
    artist = Artist.create(name: "Fun Person Who Sings")
    song = Song.create(name: "Sweet Tunez", genre: @genre)
    artist.songs << song
    artist.save

    expect(@genre.artists).to include(artist)
  end
end