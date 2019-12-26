require 'json'
require 'shellwords'
require 'pathname'
require 'ostruct'
require 'yaml'
require 'toml-rb'

def symlink?(file_path)
  File.symlink?(file_path)
end

#
# pp read_yml('/Users/xiongzenghui/Desktop/workspace/ZHUDID_workspace/project/osee2unified/Venomfiles/customization.yml')
def read_yml(file)
  YAML.safe_load(File.open(file))
end

def read_toml(file)
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
