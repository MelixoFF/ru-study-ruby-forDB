module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each(&block)
        for element in self
          block.call(element)
        end
      end
      # Написать свою функцию my_map
      def my_map(&block); 
        new_array = MyArray.new
        for element in self
          new_array.push(block.call(element))
        end
        return new_array
      end

      # Написать свою функцию my_compact
      def my_compact(); 
        new_array = MyArray.new
        for element in self
           if element != nil
              new_array.push(element)
           end
        end
        return new_array
      end

      # Написать свою функцию my_reduce
      def my_reduce(working_value=nil, &block); 
        for element in self
          if working_value == nil
            working_value = element
          else
            working_value = block.call(working_value, element)
          end
        end
        return working_value
      end
    end
  end
end
