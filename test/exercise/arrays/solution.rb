module Exercise
  module Arrays
    class << self
      def replace(array)

        def findMax(array)
          maxValue = array[0]
          for el in array
            if el>maxValue
              maxValue=el
            end
          end
          return maxValue
        end

        return array.map{|el| el>0 ? findMax(array) : el}
        
      end

      def search(array, query)
        return -1 if array.length == 0
        leftEdge = 0
        prevRightEdge = -1
        prevLeftEdge = -1
        rightEdge = array.length-1
        while true
          centre = (leftEdge+rightEdge)/2
          if array[leftEdge] == query
            return leftEdge
          elsif array[rightEdge] == query
            return rightEdge
          elsif array[centre]>query
            rightEdge = centre
            if rightEdge == prevRightEdge
              return -1
            else
              prevRightEdge = centre
            end
          elsif array[centre]<query
            leftEdge = centre
            if leftEdge == prevLeftEdge
              return -1
            else
              prevLeftEdge = centre
            end
          elsif array[centre]==query
            return centre
          end
        end
      end
    end
  end
end
