require 'json'
require 'pathname'
require 'ostruct'
require 'fileutils'
require 'yaml'
require 'zip'
require 'shellwords'

def timestamp
  Time.now.strftime('%Y-%m-%d-%H-%M-%S')
end

def file_join(files)
  # File.join('DKNightVersion', 'Pod', 'Classes', 'UIKit') => DKNightVersion/Pod/Classes/UIKit
  File.join(files)
end

def format_file_size(bytes, k = 1024)
  return '0 B' unless bytes
  return '0 B' if bytes.zero?

  suffix = %w[B KB MB GB TB PB EB ZB YB]
  i = (Math.log(bytes) / Math.log(k)).floor
  base = (k ** i).to_f
  num = (bytes / base).round(2)
  "#{num} " + suffix[i]
end

def expand_path(path, dir)
  File.expand_path(path, dir)
end

def dir_glob(expr, dir, options = {})
  return nil unless dir
  return nil unless Dir.exist?(dir)

  log = options[:log]
  if log
    puts "[dir_glob] expr: #{expr}"
    puts "[dir_glob] dir: #{dir}"
    expand_path = File.expand_path(expr, dir)
    puts "[dir_glob] expand_path: #{expand_path}"
    Dir.glob(expand_path)
  else
    Dir.glob(File.expand_path(expr, dir))
  end
end
# pp dir_glob("*.rb", Dir.pwd)

def file_size(file_path)
  return 0 unless File.exist?(file_path)

  # 避免 . 和 .. 产生 死循环
  basename = File.basename(file_path)
  return 0 if %w(. ..).include?(basename)

  total = 0
  if File.directory?(file_path)
    Dir.foreach(file_path) { |file_name|
      total += file_size(File.join(file_path, file_name))
    }
  else
    total += File.stat(file_path).size
  end
  total
end
# size = file_size('/Users/xiongzenghui/Downloads/RubyMine-2019.3.4.dmg')
# puts size
# puts format_file_size(size)
# puts format_file_size(size, 1000)
