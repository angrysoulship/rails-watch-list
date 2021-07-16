# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# db/seeds.rb


# List.create(name: "Cyberpunk", img_url: "https://image.tmdb.org/t/p/w500/63N9uy8nd9j7Eog2axPQ8lbr3Wj.jpg")
# List.create(name: "Dystopian Fiction", img_url: "https://image.tmdb.org/t/p/w500/2EOfGaRluwJe6OlR21JtbLhWDvt.jpg")
# List.create(name: "Space Exploration", img_url: "https://image.tmdb.org/t/p/w500/ve72VxNqjGM69Uky4WTo2bK6rfq.jpg")

puts "list done"

# Movie.create(title: "Alien(1973)", overview: "Based on a story by O'Bannon and Ronald Shusett, it follows the crew of the commercial space tug Nostromo, who encounter the eponymous Alien, an aggressive and deadly extraterrestrial set loose on the ship. ", poster_url: "https://image.tmdb.org/t/p/original/vfrQk5IPloGg1v9Rzbh2Eg3VGyM.jpg", rating: 9.8)
# Movie.create(title: "Blade Runner 2049", overview: "Thirty years after the events of the first film, a new blade runner, LAPD Officer K, unearths a long-buried secret that has the potential to plunge what's left of society into chaos. K's discovery leads him on a quest to find Rick Deckard, a former LAPD blade runner who has been missing for 30 years.", poster_url: "https://image.tmdb.org/t/p/w500/gajva2L0rPYkEWjzgFlBXCAVBE5.jpg", rating: 7.5)
# Movie.create(title: "Ghost in the Shell", overview: "In the near future, Major is the first of her kind: a human saved from a terrible crash, then cyber-enhanced to be a perfect soldier devoted to stopping the world's most dangerous criminals.", poster_url: "https://image.tmdb.org/t/p/w500/myRzRzCxdfUWjkJWgpHHZ1oGkJd.jpg", rating: 6.0)
# Movie.create(title: "The Matrix", overview: "Set in the 22nd century, The Matrix tells the story of a computer hacker who joins a group of underground insurgents fighting the vast and powerful computers who now rule the earth.", poster_url: "https://image.tmdb.org/t/p/w500/f89U3ADr1oiB1s9GkdPOEpXUk5H.jpg", rating: 8.2)

# Movie.create(title: "Akiraアキラ", overview: "A secret military project endangers Neo-Tokyo when it turns a biker gang member into a rampaging psychic psychopath that only two teenagers and a group of psychics can stop.", poster_url: "https://image.tmdb.org/t/p/w500/neZ0ykEsPqxamsX6o5QNUFILQrz.jpg", rating: 8.0)

# Movie.create(title: "2001: A Space Odyssey", overview: "Humanity finds a mysterious object buried beneath the lunar surface and sets off to find its origins with the help of HAL 9000, the world's most advanced super computer.", poster_url: "https://image.tmdb.org/t/p/w500/ve72VxNqjGM69Uky4WTo2bK6rfq.jpg", rating: 8.1)

# Movie.create(title: "A Clockwork Orange", overview: "In a near-future Britain, young Alexander DeLarge and his pals get their kicks beating and raping anyone they please. When not destroying the lives of others, Alex swoons to the music of Beethoven.", poster_url: "https://image.tmdb.org/t/p/w500/4sHeTAp65WrSSuc05nRBKddhBxO.jpg", rating: 8.2)

# Movie.create(title: "Star Trek", overview: "The fate of the galaxy rests in the hands of bitter rivals. One, James Kirk, is a delinquent, thrill-seeking Iowa farm boy. The other, Spock, a Vulcan, was raised in a logic-based society that rejects all emotion.", poster_url: "https://image.tmdb.org/t/p/w500/9vaRPXj44Q2meHgt3VVfQufiHOJ.jpg", rating: 7.4)

require 'json'
require 'open-uri'
url = "http://tmdb.lewagon.com/search/movie?query="
movies_serialized = open(url).read
movies = JSON.parse(movies_serialized)

movies["results"].each do |m|
  movie = Movie.create!(
    title: m["original_title"],
    overview: "#{m["overview"]}.",
    poster_url: "https://image.tmdb.org/t/p/w500/#{m["poster_path"]}",
    rating: m["vote_average"]
)
  puts "#{m["original_title"]} created"
end


