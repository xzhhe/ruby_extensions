require 'json'
require 'pathname'
require 'ostruct'
require 'fileutils'
require 'yaml'
require 'shellwords'

def write_to_file(str, file)
  File.open(file, 'w+') { |f| f.write(str) }
end

def write_hash_to_json(hash, file)
  File.open(file, 'w+') { |f| f.write(JSON.generate(hash)) }
end

def write_hash_to_yml(hash, file)
  File.open(file, 'w+') { |f| f.write(hash.to_yaml) }
end
# write_hash_to_yml({'name' => 'xiong', 'age' => 99}, 'haha1.yml')
# write_hash_to_yml([{'name' => 'xiong', 'age' => 99}, {'name' => 'xiong', 'age' => 99}], 'haha2.yml')

def write_file(file, content)
  File.open(file, 'w+') { |f| f.write(content) }
end
