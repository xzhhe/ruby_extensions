require 'digest'
require 'json'

class String
  #
  # puts '111111'.ext_md5
  def ext_md5
    Digest::MD5.hexdigest(self)
  end
end

def version_compare(ver1, ver2)
  Gem::Version.new(ver1) > Gem::Version.new(ver2)
end

#
# puts string_eql?('111', '222')
# puts string_eql?('111', '111')
def string_eql?(str1, str2)
  return false if !str1 || !str2

  str1_s = Digest::MD5.hexdigest(str1.to_s.downcase.strip)
  str2_s = Digest::MD5.hexdigest(str2.to_s.downcase.strip)
  str1_s.eql?(str2_s)
end

def string_exist?(str)
  return false unless str
  return false if str.strip.empty?
  true
end
# puts string_exist?(nil)
# puts string_exist?('')
# puts string_exist?(' ')
# puts string_exist?("")
# puts string_exist?("  ")
# puts string_exist?(" 11 ")

class String
  #
  # puts '111'.ext_eql?('111')
  # puts '111'.ext_eql?('222')
  def ext_eql?(other)
    string_eql?(self, other)
  end
end

class String
  #
  # File.read('/Users/xiongzenghui/Desktop/xzhworkspace/xxx-iOS-Release.json').ext_to_hash
  def ext_to_hash
    JSON.parse(self)
  end

  #
  # File.read('/Users/xiongzenghui/Desktop/xzhworkspace/xxx-iOS-Release.json').ext_to_ostruct
  def ext_to_ostruct
    JSON.parse(self, object_class: OpenStruct)
  end
end


class String
  #
  # ' 12 '.ext_remove_whitespace
  alias ext_remove_whitespace strip

  #
  # '111'.ext_write_to_file('/Users/xiongzenghui/Desktop/haha.txt')
  def ext_write_to_file(file_path)
    File.open(file_path, 'w+') { |f| f.write(self) }
  end

  #
  # '/Users/xiongzenghui/Desktop/ruby_extensions/haha.txt'.ext_basename
  # '/Users/xiongzenghui/Desktop/ruby_extensions/haha.txt'.ext_basename('.txt')
  def ext_basename(expr = '')
    File.basename(self) if expr.empty?
    File.basename(self, expr)
  end
end
