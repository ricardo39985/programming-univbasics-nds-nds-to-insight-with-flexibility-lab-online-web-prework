# Provided, don't edit
require 'directors_database'
require 'pry'
# A method we're giving you. This "flattens"  Arrays of Arrays so: [[1,2],
# [3,4,5], [6]] => [1,2,3,4,5,6].
def flatten_a_o_a(aoa)
  result = []
  i = 0
  while i < aoa.length do
    k = 0
    while k < aoa[i].length do
      result << aoa[i][k]
      k += 1
    end
    i += 1
  end
  result
end
def movie_with_director_name(director_name, movie_data)
  {
    :title => movie_data[:title],
    :worldwide_gross => movie_data[:worldwide_gross],
    :release_year => movie_data[:release_year],
    :studio => movie_data[:studio],
    :director_name => director_name
  }
end
# Your code after this point
def movies_with_director_key(name, movies_collection)
  movie_index = 0
  result = []
  while movie_index < movies_collection.size do
    result << movie_with_director_name(name, movies_collection[movie_index])
    movie_index += 1
  end
result
end
def gross_per_studio(collection)
  hash = {}
  index = 0
  while index < collection.size do
    if hash[collection[index][:studio]]
      hash[collection[index][:studio]] += collection[index][:worldwide_gross]
      else
        hash[collection[index][:studio]] = collection[index][:worldwide_gross]
      end
    index += 1
  end
  hash
   while index < collection.size do
     #binding.pry
      hash[collection[index][:studio]] = collection[index][:worldwide_gross]
      index += 1
    end
    hash
end
def movies_with_directors_set(source)
  source.map do |h|
    movies_with_director_key(h[:name], h[:movies])
  end
end
#when given a Hash with keys :name and :movies,
#returns an Array of Hashes that represent movies
#and each Hash has a :director_name key set with the value that was in :name
# ----------------    End of Your Code Region --------------------
# Don't edit the following code! Make the methods above work with this method
# call code. You'll have to "see-saw" to get this to work!
def studios_totals(nds)
  a_o_a_movies_with_director_names = movies_with_directors_set(nds)
  movies_with_director_names = flatten_a_o_a(a_o_a_movies_with_director_names)
  return gross_per_studio(movies_with_director_names)
end
