require 'fileutils'
require 'zip'

def unzip_file(src, dest)
  FileUtils.mkdir_p(dest) unless Dir.exist?(dest)
  Zip::File.open(src) do |zip_file|
    zip_file.each do |f|
      fpath = File.join(dest, f.name)
      zip_file.extract(f, fpath)
    end
  end
end

def unzip_ipa(ipa, output)
  return nil unless ipa
  return nil if ipa.empty?
  return nil unless File.exist?(ipa)

  # create output dir if need ?
  FileUtils.rm_rf(output)
  FileUtils.mkdir_p(output)

  # xx.ipa => xx.zip
  cp_dest = File.expand_path('ipa.zip', output)
  cp(ipa, cp_dest)

  # xx.zip => Payload/
  unzip_file(cp_dest, output)

  File.expand_path('Payload', output)
end
#
# ipa     = '/Users/xiongzenghui/Downloads/app.ipa'
# output  = '/Users/xiongzenghui/Downloads/output'
# payload = Fastlane::Helper::FileHelper.unzip_ipa(ipa, output)
# puts "payload: #{payload}"
