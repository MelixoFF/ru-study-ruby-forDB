module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each(element_index = 0, &block)
        if length != element_index
          block.call(self[element_index])
          my_each(element_index + 1, &block)
        end
        self
      end

      # Написать свою функцию my_map
      def my_map(&block)
        func = ->(accum, element) { MyArray.new(accum + [block.call(element)]) }
        my_reduce([], &func)
      end

      # Написать свою функцию my_compact
      def my_compact
        func = ->(accum, element) { element.nil? ? accum : MyArray.new(accum + [element]) }
        my_reduce([], &func)
      end

      # Написать свою функцию my_reduce
      def my_reduce(working_value = nil, element_index = 0, &block)
        return working_value if length == element_index
        
        working_value = if working_value.nil?
                          self[element_index]
                        else
                          block.call(working_value, self[element_index])
                        end
        my_reduce(working_value, element_index + 1, &block)
      end
    end
  end
end
