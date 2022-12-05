require 'albums_repository'

RSpec.describe AlbumRepository do

  def reset_album_table
    seed_sql = File.read('spec/seeds_albums.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' })
    connection.exec(seed_sql)
  end

  before(:each) do
    reset_album_table
  end

  it 'returns a list of Albums' do
    repo = AlbumRepository.new
    albums = repo.all

    expect(albums.length).to eq(2)

    expect(albums.first.id).to eq('1')
    expect(albums.first.title).to eq('Section.80')
    expect(albums.first.release_year).to eq('2010')
  end

  it 'returns the single album Section.80' do
    repo = AlbumRepository.new
    album = repo.find(1)
    
    expect(album.title).to eq('Section.80')
    expect(album.release_year).to eq('2010')
    expect(album.artist_id).to eq('1')
  end
end