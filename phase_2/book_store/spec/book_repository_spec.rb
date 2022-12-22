require 'book_repository'

RSpec.describe BookRepository do
  
  # Refreshes table contents every time a test suite is run
  def reset_books_table
    seed_sql = File.read('spec/seeds_books.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'book_store_test' })
    connection.exec(seed_sql)
  end

  before(:each) do
    reset_books_table
  end

  it 'returns two books' do
    repo = BookRepository.new

    books = repo.all
    expect(books.length).to eq(2)
    expect(books.first.id).to eq('1')
    expect(books.first.title).to eq('Red Notice')
    expect(books.first.author_name).to eq('Bill Browder')
    expect(books.last.title).to eq('The Republic')
    expect(books.last.author_name).to eq('Plato')
  end
end