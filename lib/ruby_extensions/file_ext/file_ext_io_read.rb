require 'json'
require 'pathname'
require 'ostruct'
require 'yaml'
require 'shellwords'

def symlink?(file_path)
  File.symlink?(file_path)
end

def read_yml(file)
  pp YAML.safe_load(File.open(file))
end

def read_toml(file)
  require 'toml-rb'
  # xx.toml 键值对, 可以有空格
  # # Hello, this is an example.
  # [things]
  # other="things"
  # what= 900000
  TomlRB.load_file(file, symbolize_keys: true)
end

def read_lines(file)
  File.readlines(file)
end

def read_json_to_obj(filepath)
  JSON.parse(File.read(filepath), object_class: OpenStruct)
end

def read_json(filepath)
  JSON.parse(File.read(filepath))
end
