scanned_dirs = ARGV.flatten
COLUMN_SIZE = 5

extensions = {}
aggregated_result = {}

def pad(string, pad_size)
  string = string.to_s
  padding = ' ' * (pad_size - string.length)
  string + padding
end

## -- compute lines

scanned_dirs.each do |dirname|
  local_result = { 'total' => 0 }

  file_names = File.directory?(dirname) ? Dir[dirname + '/**/*'] : [dirname]

  file_names.each do |file_name|
    extension = file_name.split('.').last
    count = 0

    next if File.directory?(file_name)

    File.open(file_name, 'r') do |handler|
      handler.each { |line| count += 1 unless line.strip.empty? }
    end

    extensions[extension] = true
    local_result[extension] = 0 unless local_result.key?(extension)
    local_result[extension] += count
    local_result['total'] += count
  end

  aggregated_result[dirname] = local_result
end

## -- print output

max_name_length = scanned_dirs.max_by(&:length).length

# print headers
padded_line_count_headers = extensions.keys.map { |key| pad(key, COLUMN_SIZE) }.join(' ')
padded_name_header = pad('name', max_name_length)
puts("#{padded_name_header} #{padded_line_count_headers}")

# print results
aggregated_result.sort_by { |_dir, res| -res['total'] }.each do |dir, res|
  padded_dir_name = pad(dir, max_name_length)
  padded_line_counts = extensions
                         .keys
                         .map { |extension| pad(res.fetch(extension, 0), COLUMN_SIZE) }
                         .join(' ')

  puts("#{padded_dir_name} #{padded_line_counts}")
end
