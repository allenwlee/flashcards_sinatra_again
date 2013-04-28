

User.create(name: "mike", email: "m@ike.com", password: "viewsonic")


@movies_deck = Deck.create(category: 'movies')
@state_capitals_deck = Deck.create(category: 'state_capitals')
@music_deck = Deck.create(category: 'music')

CSV.foreach('oscar_winners.csv') do |row|
   @movies_deck.cards << Card.create(question: row[0], answer: row[1])
end

CSV.foreach('artists_songs.csv') do |row|
  @music_deck.cards << Card.create(question: row[0], answer: row[1])
end

CSV.foreach('state_capitals.csv') do |row|
  @state_capitals_deck.cards << Card.create(question: row[0], answer: row[1])
end



