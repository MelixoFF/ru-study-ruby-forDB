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

      def search(_array, _query)
        0
      end
    end
  end
end
