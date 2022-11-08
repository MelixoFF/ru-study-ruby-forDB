module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def find_comma_in_string(string_el)
        if string_el
          return string_el.include? ','
        end
      end

      def rating(array)
        filtered_films = array.filter { |film| find_comma_in_string(film['country']) }
        ratings_of_films = filtered_films
        .map { |film| film["rating_kinopoisk"].to_f }
        .filter { |rating| rating != 0.0 }
        return ratings_of_films.reduce(:+)/ratings_of_films.length
      end 

      def chars_count(films, threshold)
        filtered_films = films.map { |film| film["rating_kinopoisk"].to_f <= threshold ? nil : film["name"] }.compact
        return filtered_films.reduce(0) { |counter, film_name| counter+film_name.count('и') }
      end
    end
  end
end
