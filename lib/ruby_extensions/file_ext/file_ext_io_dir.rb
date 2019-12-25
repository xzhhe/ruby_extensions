require 'pathname'
require 'fileutils'

def dir_exist?(file)
  Dir.exist?(file)
end

def file_exist?(file)
  File.exist?(file)
end

def pwd
  FileUtils.pwd
end

def pwd_path(file)
  File.expand_path(file, __dir__)
end

def rm_rf(path)
  FileUtils.rm_rf(path)
end

def mkdir(list)
  FileUtils.mkdir_p(list)
end
# mkdir(['dir1', 'dir2'])

def ensure_dir_exist(dir)
  return if Dir.exist?(dir)

  FileUtils.rm_rf(dir) if File.exist?(dir)
  FileUtils.rm_rf(dir) if File.symlink?(dir)
  FileUtils.mkdir(dir)
end
# ensure_dir_exist('/Users/xiongzenghui/Desktop/xzhworkspace/haha')

def mv(list, dir)
  FileUtils.mv(list, dir)
end

def touch(list)
  FileUtils.touch(list)
end

def cp(src, dest)
  FileUtils.cp_r(src, dest)
end

def escape(str)
  Shellwords.escape(str)
end
