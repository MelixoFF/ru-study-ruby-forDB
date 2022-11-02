module Exercise
  module Arrays
    class << self

      def find_max(array)
        max_value = array[0]
        for el in array
          if el > max_value
            max_value = el
          end
        end
        return max_value
      end

      def replace(array)
        return array.map{|el| el > 0 ? find_max(array) : el}
      end

      def search(array, query, left_edge=0)
        return left_edge if array[0] == query
        return -1 if array.length <= 1
        centre = (0+(array.length-1))/2
        if array[centre] >= query
          return search(array[0,centre], query, left_edge)
        else
          return search(array[centre+1, array.length-(centre+1)], query, left_edge+centre+1)
        end
      end
    end
  end
end
