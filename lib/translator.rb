require 'yaml'

def load_library(file_path)
  definitions = {
    "get_meaning" => { },
    "get_emoticon" => { }
  }

  library = YAML.load_file(file_path)

  library.each do |meaning, emoticons|
    definitions["get_meaning"][emoticons[1]] = meaning
    definitions["get_emoticon"][emoticons[0]] = emoticons[1]
  end

  definitions
end

def get_japanese_emoticon(file_path, emoticon)

  definitions = load_library(file_path)

  if definitions['get_emoticon'].has_key?(emoticon)
    definitions['get_emoticon'].fetch(emoticon)
  else
    'Sorry, that emoticon was not found'
  end
end

def get_english_meaning(file_path, emoticon)
  definitions = load_library(file_path)

  if definitions['get_meaning'].has_key?(emoticon)
    definitions['get_meaning'].fetch(emoticon)
  else
    'Sorry, that emoticon was not found'
  end
end
