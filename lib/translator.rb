require "yaml"

def load_library(path)
  library = { "get_emoticon" => {}, "get_meaning" => {} }
  YAML.load_file(path).each do |meaning, emoticons|
    english_emoticon = emoticons[0]
    japanese_emoticon = emoticons[1]
    library["get_meaning"][japanese_emoticon] = meaning
    library["get_emoticon"][english_emoticon] = japanese_emoticon
  end
  library
end

def get_japanese_emoticon(path,emoticon)
  library = load_library(path)
  japanese = library["get_emoticon"][emoticon]
  japanese ? japanese : "Sorry, that emoticon was not found"
end

def get_english_meaning(path,emoticon)
  library = load_library(path)
  meaning = library["get_meaning"][emoticon]
  meaning ? meaning : "Sorry, that emoticon was not found"
end