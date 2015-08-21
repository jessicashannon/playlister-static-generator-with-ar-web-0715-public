
class SiteGenerator
  attr_accessor :rendered_path

  def initialize(path)
    @rendered_path = path
  end

  def build_index
    FileUtils.mkdir_p @rendered_path unless Dir.exist? @rendered_path
    template = File.read('app/views/index.html.erb')
    erb = ERB.new(template)
    File.open("#{@rendered_path}/index.html", "w+") do |f|
      f.puts erb.result(binding)
    end
  end



  def build_artists_index
    FileUtils.mkdir_p "#{@rendered_path}/artists/" unless Dir.exist? "#{@rendered_path}/artists"
    template = File.read('app/views/artists/index.html.erb')
    erb = ERB.new(template)
    File.open("#{@rendered_path}/artists/index.html", "w+") do |f|
      f.puts erb.result(binding)
    end
  end

  def build_songs_index
    FileUtils.mkdir_p "#{@rendered_path}/songs/" unless Dir.exist? "#{@rendered_path}/songs/"
    template = File.read('app/views/songs/index.html.erb')
    erb = ERB.new(template)
    File.open("#{@rendered_path}/songs/index.html", "w+") do |f|
      f.puts erb.result(binding)
    end
  end
  #
  def build_genres_index
    FileUtils.mkdir_p "#{@rendered_path}/genres/" unless Dir.exist? "#{@rendered_path}/genres"
    template = File.read('app/views/genres/index.html.erb')
    erb = ERB.new(template)
    File.open("#{@rendered_path}/genres/index.html", "w+") do |f|
      f.puts erb.result(binding)
    end
  end

  def build_artist_page
    FileUtils.mkdir_p "#{@rendered_path}/artists/" unless Dir.exist? "#{@rendered_path}/artists"
    template = File.read('app/views/artists/show.html.erb') #reads from  template
    erb = ERB.new(template) #creates new ERB object from template
    Artist.all.map do |artist| #maps each artist to its new HTML page
      @artist = artist
      File.open("#{@rendered_path}/artists/#{artist.to_slug}.html", "w+") do |f|
        f.puts erb.result(binding)
      end
    end
  end
  #
  def build_genre_page
  FileUtils.mkdir_p "#{@rendered_path}/genres/" unless Dir.exist? "#{@rendered_path}/genres"
    template = File.read('app/views/genres/show.html.erb') #reads from template
    erb = ERB.new(template) #creates new ERB object from template
    Genre.all.map do |genre| #maps each artist to its new HTML page
      @genre = genre
      File.open("#{@rendered_path}/genres/#{genre.to_slug}.html", "w+") do |f|
        f.puts erb.result(binding)
      end
    end
  end
  #
  def build_song_page
    FileUtils.mkdir_p "#{@rendered_path}/songs/" unless Dir.exist? "#{@rendered_path}/songs"
    template = File.read('app/views/songs/show.html.erb')
    erb = ERB.new(template)
    Song.all.each do |song|
      @song = song
      File.open("#{@rendered_path}/songs/#{song.to_slug}.html", "w+") do |f|
        f.puts erb.result(binding)
      end
    end
  end

end
