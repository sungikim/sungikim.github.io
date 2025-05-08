# update_image_links.rb
require 'fileutils'

# 컬렉션 맵핑
COLLECTIONS = {
  '_diary' => 'diary',
  '_memory' => 'memory',
  '_design' => 'design',
  '_book' => 'book',
  '_movie' => 'movie',
  '_make' => 'make',
  '_etc' => 'etc'
}

# 각 마크다운 파일 처리
Dir.glob(['**/*.md', '**/*.markdown']).each do |file|
  collection_dir = File.dirname(file).split('/').first
  collection_name = COLLECTIONS[collection_dir]
  
  next unless collection_name # 매칭되는 컬렉션이 없으면 건너뛰기
  
  content = File.read(file)
  original_content = content.dup
  
  # 이미지 링크 패턴 찾아서 변경
  updated_content = content.gsub(/!\[\]\((\.\.\/photo\/[^)]+)\)/) do
    image_file = $1.sub('../photo/', '')
    "![](/photo/#{collection_name}/#{image_file})"
  end
  
  # 변경사항이 있으면 파일 업데이트
  if original_content != updated_content
    File.write(file, updated_content)
    puts "Updated image links in: #{file}"
  end
end

puts "All image links have been updated!"