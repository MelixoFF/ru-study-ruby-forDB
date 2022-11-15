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
        func = ->(accum, element) { MyArray.new(accum+[block.call(element)]) }
        return self.my_reduce(working_value = [], &func)
      end

      # Написать свою функцию my_compact
      def my_compact(); 
        func = ->(accum, element) { element != nil ? MyArray.new(accum+[element]) : accum  }
        return self.my_reduce(working_value = [], &func)
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
