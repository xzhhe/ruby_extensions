require 'json'
require 'ostruct'

def hash_to_obj(hash)
  # https://zaiste.net/ruby_hash_to_object_with_open_struct_json/
  # OpenStruct.new(hash) #=> OpenStruct constructor only converts its top level keys
  hash.to_obj
end

## Hash to json string
# hash ={
#   name: 'xiongzenghui',
#   age: 99
# }
# pp hash.to_json         #=> "{\"name\":\"xiongzenghui\",\"age\":99}"
# pp JSON.generate(hash)  #=> "{\"name\":\"xiongzenghui\",\"age\":99}"
def hash_generate_json(hash)
  JSON.generate(hash)
end

def hash_pretty_generate_json(hash)
  JSON.pretty_generate(hash)
end

def hash_get_value(hash, key)
  value = hash[key.to_s]
  value ||= hash[key.to_sym]
  value
end

def reverse_hash(hash)
  Hash[hash.map { |k, v| [v, k] }]
end

def hash_write_to_file(file_path, options = {})
  if options[:pretty]
    File.open(file_path, 'w+') { |f| f.write(JSON.pretty_generate(self)) }
  else
    File.open(file_path, 'w+') { |f| f.write(JSON.generate(self)) }
  end
end

class Hash
  def ext_to_obj
    JSON.parse(to_json, object_class: OpenStruct)
  end

  def ext_to_json
    JSON.generate(self)
  end

  def ext_to_pretty_json
    JSON.pretty_generate(self)
  end

  def ext_get(key)
    hash_get_value(self, key)
  end

  def ext_reverse
    reverse_hash(self)
  end

  def ext_write_to_file(file_path, options = {})
    if options[:pretty]
      File.open(file_path, 'w+') { |f| f.write(JSON.pretty_generate(self)) }
    else
      File.open(file_path, 'w+') { |f| f.write(JSON.generate(self)) }
    end
  end
end

# hash = File.read('/Users/xiongzenghui/Desktop/xzhworkspace/Release.json')
# hash = {
#   "target_gitlab": "git@xiongzenghui/osee2unified.git",
#   "target_branch": "athena_yml",
#   "make_target": "all_source"
# }
# puts hash.ext_to_obj
# puts hash.ext_to_json
# puts hash.ext_to_pretty_json
# puts hash.ext_get('target_gitlab')
# puts hash.ext_get(:target_gitlab)
# puts hash.ext_reverse
# hash.ext_write_to_file('/Users/xiongzenghui/Desktop/haha.txt', pretty: true)
