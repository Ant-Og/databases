require_relative 'lib/database_connection'
require_relative 'lib/artists_repository'
require_relative 'lib/albums_repository'

# We need to give the database name to the method `connect`.
DatabaseConnection.connect('music_library')

artists_repository = ArtistRepository.new
albums_repository = AlbumRepository.new
=begin
artists_repository.all.each do |artist|
  p artist
end

albums_repository.all.each do |album|
  p album
end
=end
artist = artists_repository.find(1)
puts artist.name

album = albums_repository.find(1)
puts album.title


=begin
# Perform a SQL query on the database and get the result set.
sql = 'SELECT id, title FROM albums;'
result = DatabaseConnection.exec_params(sql, [])
#Print out each record from the result set .
result.each do |record|
  p record
end
=end