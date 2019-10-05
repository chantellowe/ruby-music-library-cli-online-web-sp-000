class MusicLibraryController
  attr_accessor :path 
  
  def initialize(path = './db/mp3s')
    @path = path
    MusicImporter.new(path).import
  end
  
  def call
    
      puts "Welcome to your music library!"
      
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      
      puts "To play a song, enter 'play song'."
      
      puts "To quit, type 'exit'."
      
      puts "What would you like to do?"
      
      count = 1 
      until count > 4
        input = gets.chomp
        count += 1 
      end

  end
  
  def list_songs
    Song.all.sort{|a,b| a.name <=> b.name}.each_with_index do |song, i|
        puts "#{i+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end
  
  def list_artists
    Artist.all.sort{|a,b| a.name <=> b.name}.each_with_index do |artist, i|
      puts "#{i+1}. #{artist.name}"
    end
  end
  
  def list_genres
    Genre.all.sort{|a,b| a.name <=> b.name }.each_with_index do |genre, i|
      puts "#{i+1}. #{genre.name}"
    end
  end
  
end