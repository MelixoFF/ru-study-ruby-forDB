module Exercise
  module Arrays
    class << self
      def replace(array)

        def find_max(array)
          max_value = array[0]
          for el in array
            if el>max_value
              max_value=el
            end
          end
          return max_value
        end

        return array.map{|el| el>0 ? find_max(array) : el}
        
      end

      def search(array, query, left_edge=nil, right_edge=nil)
        if left_edge == nil
          left_edge = 0
        end
        if right_edge == nil
          right_edge = array.length - 1
        end
        centre = (left_edge+right_edge)/2
        if array.length == 0 
          return -1 
        end
        if array[left_edge] == query 
          return left_edge 
        end
        if array[right_edge] == query 
          return right_edge
        end
        if array[centre]==query 
          return centre
        end
        if right_edge-left_edge<=1 
          return -1
        end

        if array[centre]>query
          right_edge = centre
          return search(array, query, left_edge, right_edge)
        end
        if array[centre]<query
          left_edge = centre
          return search(array, query, left_edge, right_edge)
        end 
      end
    end
  end
end
