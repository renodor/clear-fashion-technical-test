# frozen_string_literal:true

require 'pry'

def display_nested_hash(hash, level = 0)
  hash.each do |key, value|
    puts "#{'--' * level}#{key}"

    next if value.empty?

    display_nested_hash(value.sort.to_h, level + 1)
  end
end

def render_tree(paths)
  tree = {}
  paths.compact.uniq.reject(&:empty?).each do |path|
    current_directory = tree

    path.split('/').reject(&:empty?).each do |directory|
      current_directory[directory] ||= {}

      current_directory = current_directory[directory]
    end
  end

  display_nested_hash(tree.sort.to_h)
end

render_tree(
  [
    '/home/michel/photos/wallpaper.png',
    '/etc/passwd',
    '/etc/nginx/conf.d/website.conf',
    '/home/michel/cv.pdf',
    '/etc/hosts',
    '/home/michel/photos/profile.jpg',
    '/home/michel'
  ]
)

render_tree(
  [
    '',
    nil,
    '/',
    '/home/michel/photos/wallpaper.png',
    '/home/michel/photos/wallpaper.png/',
    '/home/michel'
  ]
)