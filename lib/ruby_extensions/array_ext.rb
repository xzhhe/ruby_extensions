#
# pp zip_to_hash(['name', 'age'], ['xiongzenghui', 99], symbol_key: true)
# pp zip_to_hash(['name', 'age'], ['xiongzenghui', 99])
def zip_to_hash(keys, values, options = {})
  if options[:symbol_key]
    keys.map(&:to_sym).zip(values).to_h
  else
    keys.zip(values).to_h
  end
end

class Array
  #
  # puts [true, false].or?
  # puts [true, false].any?
  # puts [true, true].or?
  # puts [true, true].any?
  # puts [false, false].or?
  # puts [false, false].any?
  alias and? all?
  alias or? any?

  #
  # [].push('111')
  # [].push(['111', '222'])
  def ext_push(ele)
    if ele.is_a?(Array)
      push(*ele)
    else
      push(ele)
    end
  end

  #
  # ['111', 'haha/222'].include?('222')          # => false
  # ['111', 'haha/222'].ext_include?('222')      # => true
  def ext_include?(key_world)
    map { |e| e.include?(key_world) }.any?
  end

  #
  # class Person
  #   def run(name, age)
  #     puts "#{object_id} name: #{name}, age: #{age}"
  #   end
  # end
  # [Person.new, Person.new, Person.new].ext_map(:run, 'xiong', 99)
  def ext_map(message, *args)
    map { |e| e.send(message.to_sym, *args) }
  end

  #
  # [1,1,2,2,222,3].ext_repeat_values #=> [1, 2]
  def ext_repeat_values
    group_by { |e| e }.select { |_, v| v.size > 1 }.map(&:first)
  end

  #
  # pp ['name', 'age'].ext_zip(['xiongzenghui', 99])
  # pp ['name', 'age'].ext_zip(['xiongzenghui', 99], symbol_key: true)
  def ext_zip(values, options = {})
    zip_to_hash(self, values, options)
  end
end
