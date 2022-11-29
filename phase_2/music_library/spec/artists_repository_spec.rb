require 'artists_repository'

RSpec.describe ArtistRepository do

  def reset_artist_table
    seed_sql = File.read('spec/seeds_artists.sql')
    password = 'password'
    connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test', password: password })
    connection.exec(seed_sql)
  end

  before(:each) do
    reset_artist_table
  end

  it 'returns a list of artists' do
    repo = ArtistRepository.new

    artists = repo.all

    expect(artists.length).to eq(2)
    expect(artists.first.id).to eq('1')
    expect(artists.first.name).to eq('Kendrick Lamar')
  end
end