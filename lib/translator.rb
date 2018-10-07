require 'yaml'
require 'pry'

def load_library(path)
  emoticons = {"get_meaning" => {}, "get_emoticon" => {}}
  YAML.load_file('./lib/emoticons.yml').each do |meaning, emo_hash|
      emoticons["get_meaning"][emo_hash[1]] = meaning
      emoticons["get_emoticon"][emo_hash[0]] = emo_hash[1]
  end
  emoticons
end

def get_japanese_emoticon(path, emoticon)
  emoti_hash = load_library('./lib/emoticons.yml')
  japanese_emoticon = emoti_hash["get_emoticon"][emoticon]
  if japanese_emoticon == nil
    "Sorry, that emoticon was not found"
  else
    japanese_emoticon
  end
end

def get_english_meaning(path, emoticon)
  translate = load_library('./lib/emoticons.yml')
  english_meaning = translate["get_meaning"][emoticon]
  if english_meaning == nil
    "Sorry, that emoticon was not found"
  else
    english_meaning
  end
end