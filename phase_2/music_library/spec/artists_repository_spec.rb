require 'artists_repository'

RSpec.describe ArtistRepository do

  def reset_artist_table
    seed_sql = File.read('spec/seeds_artists.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' })
    connection.exec(seed_sql)
  end

  before(:each) do
    reset_artist_table
  end

  it 'returns a list of artists' do
    repo = ArtistRepository.new
    artist = repo.all

    expect(artist.length).to eq(2)
    expect(artist.first.id).to eq('1')
    expect(artist.first.name).to eq('Kendrick Lamar')
  end

  it 'returns kendrick Lamar as single artist' do
    repo = ArtistRepository.new
    artist = repo.find(1)
    
    expect(artist.name).to eq('Kendrick Lamar')
    expect(artist.genre).to eq('Rap')
  end

  it 'returns Nas as single artist' do
    repo = ArtistRepository.new
    artist = repo.find(2)
    
    expect(artist.name).to eq('Nas')
    expect(artist.genre).to eq('Rap')
  end
end