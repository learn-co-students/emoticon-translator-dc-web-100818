# require modules here
require "yaml"
require 'pry'

#   current structure:
#     file = {
#       "angel" => ["O:)", "☜(⌒▽⌒)☞"]
#       }
#
#   the goal: 
#      hash = {
#         "get_meaning" => { 
#             "☜(⌒▽⌒)☞" => "angel"
#             }
#         "get_emoticon" => {
#             "O:)" => "☜(⌒▽⌒)☞"
#           }
#         }


def load_library(path)
  file = YAML.load_file(path)
  hash = {}
  hash["get_meaning"] = {}
  hash["get_emoticon"] = {}
  file.each do |meaning, arr|
    english = arr[0]
    japanese = arr[1]
    hash["get_meaning"][japanese] = meaning
    hash["get_emoticon"][english] = japanese
  end
  hash
end


def get_japanese_emoticon(path, emoticon)
  file = YAML.load_file(path)
  hash = load_library(path)
  r = hash["get_emoticon"][emoticon]
  if r == nil  
    return "Sorry, that emoticon was not found"
  else
    return r
  end
end


def get_english_meaning(path, emoticon)
  file = YAML.load_file(path)
  hash = load_library(path)
  r = hash["get_meaning"][emoticon]
  if r == nil 
    return "Sorry, that emoticon was not found"
  else
    return r 
  end
end