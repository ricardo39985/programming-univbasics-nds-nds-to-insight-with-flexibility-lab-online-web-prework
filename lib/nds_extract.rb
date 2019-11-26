# Provided, don't edit
require 'directors_database'
require "pry"

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
  # GOAL: For each Hash in an Array (movies_collection), provide a collection
  # of movies and a directors name to the movie_with_director_name method
  # and accumulate the returned Array of movies into a new Array that's
  # returned by this method.
  #
  # INPUT:
  # * name: A director's name
  # * movies_collection: An Array of Hashes where each Hash represents a movie
  #
  # RETURN:
  #
  # Array of Hashes where each Hash represents a movie; however, they should all have a
  # :director_name key. This addition can be done by using the provided
  # movie_with_director_name method
  result = []
  i=0
  while i < movies_collection.length
    movie_data = movies_collection[i]
    result.push(movie_with_director_name(name, movie_data))
    i+=1
  end
  result
end


def gross_per_studio(collection)
  # GOAL: Given an Array of Hashes where each Hash represents a movie,
  # return a Hash that includes the total worldwide_gross of all the movies from
  # each studio.
  #
  # INPUT:
  # * collection: Array of Hashes where each Hash where each Hash represents a movie
  #
  # RETURN:
  #
  # Hash whose keys are the studio names and whose values are the sum
  # total of all the worldwide_gross numbers for every movie in the input Hashpp
  keys = collection.uniq { |h| h[:studio] }
  i = 0

  results = {}
  while i < keys.length
    total= 0
    o = 0
    while o < collection.length
      if collection[o][:studio] == keys[i][:studio]
        total += collection[o][:worldwide_gross]
      end
      o+=1
    end
  results[keys[i][:studio]]= total
  i+=1
  end
  results
  # hash = {}
  # index = 0
  # while index < collection.size do
  #   if hash[collection[index][:studio]]
  #     hash[collection[index][:studio]] += collection[index][:worldwide_gross]
  #   else
  #     hash[collection[index][:studio]] = collection[index][:worldwide_gross]
  #   end
  #   index += 1
  # end
  # hash
  # while index < collection.size do
  #  #binding.pry
  #   hash[collection[index][:studio]] = collection[index][:worldwide_gross]
  #   index += 1
  # end
  # hash
end

def movies_with_directors_set(source)
  # GOAL: For each director, find their :movies Array and stick it in a new Array
  #
  # INPUT:
  # * source: An Array of Hashes containing director information including
  # :name and :movies
  #
  # RETURN:
  #
  # Array of Arrays containing all of a director's movies. Each movie will need
  # to have a :director_name key added to it.
  results = []
    i = 0
  while i < source.length
    j = 0
    l = []
    while j < source[i][:movies].length
      k={}
      k[:title] = source[i][:movies][j][:title]
      k[:director_name] = source[i][:name]
      j += 1
      l.push(k)
    end
    i += 1
    results.push(l)
  end
  results
end


# ----------------    End of Your Code Region --------------------
# Don't edit the following code! Make the methods above work with this method
# call code. You'll have to "see-saw" to get this to work!

def studios_totals(nds)
  a_o_a_movies_with_director_names = movies_with_directors_set(nds)
  movies_with_director_names = flatten_a_o_a(a_o_a_movies_with_director_names)
  return gross_per_studio(movies_with_director_names)

end
