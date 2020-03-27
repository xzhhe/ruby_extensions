require 'digest'
require 'json'
require 'pp'

def string_to_md5(str)
  Digest::MD5.hexdigest(str)
end

def version_compare(ver1, ver2)
  Gem::Version.new(ver1) > Gem::Version.new(ver2)
end
alias version_compare? version_compare
alias string_compare? version_compare

def string_eql?(str1, str2, options = {})
  return false if !str1 || !str2

  ignore_downcase = options[:ignore_downcase]
  ignore_downcase = true if ignore_downcase.nil?

  ignore_whitespaces = options[:ignore_whitespaces]
  ignore_whitespaces = true if ignore_whitespaces.nil?

  use_md5 = options[:use_md5]
  use_md5 = true if use_md5.nil?

  str1 = str1.to_s.downcase if ignore_downcase
  str2 = str2.to_s.downcase if ignore_downcase

  str1 = str1.strip if ignore_whitespaces
  str2 = str2.strip if ignore_whitespaces

  str1 = Digest::MD5.hexdigest(str1) if use_md5
  str2 = Digest::MD5.hexdigest(str2) if use_md5

  str1.eql?(str2)
end
# puts string_eql?('111', '222')
# puts string_eql?(' 111 ', '111')
# puts string_eql?('    111    ', '   111')
# puts string_eql?('    111    ', '   111', ignore_whitespaces: false)
# puts string_eql?('    111    ', '   111', use_md5: false, ignore_whitespaces: false)
# puts string_eql?('aaa', 'AAA')
# puts string_eql?('aaa', 'AAA', ignore_downcase: false)

def string_exist?(str)
  return false unless str
  return false if str.strip.empty?
  true
end
alias string_empty? string_exist?
# puts string_exist?(nil)
# puts string_exist?('')
# puts string_exist?(' ')
# puts string_exist?("")
# puts string_exist?("  ")
# puts string_exist?(" 11 ")
# puts string_empty?(" 11 ")

def string_to_hash(str)
  JSON.parse(str)
end

def string_to_ostruct(str)
  JSON.parse(self, object_class: OpenStruct)
end

def string_remove_whitespace(str)
  str.strip
end

def commit_short_sha(str)
  return nil unless str
  str[0, 8]
end
# puts commit_short_sha('88686786ca373b9fd43ab09b4a256f87cda753b9')

def string_write_to_file(str, file_path)
  File.open(file_path, 'w+') { |f| f.write(str) }
end

class String
  def ext_md5
    Digest::MD5.hexdigest(self)
  end
  # puts '111111'.ext_md5

  def ext_eql?(other)
    string_eql?(self, other)
  end
  # puts '111'.ext_eql?('111')
  # puts '111'.ext_eql?('222')

  def ext_to_hash
    JSON.parse(self)
  end
  # File.read('/Users/xiongzenghui/Desktop/xzhworkspace/xxx-iOS-Release.json').ext_to_hash

  def ext_to_ostruct
    JSON.parse(self, object_class: OpenStruct)
  end
  # File.read('/Users/xiongzenghui/Desktop/xzhworkspace/xxx-iOS-Release.json').ext_to_ostruct

  alias ext_remove_whitespace strip
  # ' 12 '.ext_remove_whitespace

  def ext_write_to_file(file_path)
    File.open(file_path, 'w+') { |f| f.write(self) }
  end
  # '111'.ext_write_to_file('/Users/xiongzenghui/Desktop/haha.txt')

  def ext_basename(expr = '')
    File.basename(self) if expr.empty?
    File.basename(self, expr)
  end
  # '/Users/xiongzenghui/Desktop/ruby_extensions/haha.txt'.ext_basename
  # '/Users/xiongzenghui/Desktop/ruby_extensions/haha.txt'.ext_basename('.txt')

  def ext_commit_short_sha
    self[0, 8]
  end
  # puts '88686786ca373b9fd43ab09b4a256f87cda753b9'.ext_commit_short_sha
end
