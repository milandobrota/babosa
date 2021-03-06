module Babosa
  def self.jruby15?
    JRUBY_VERSION >= "1.5" rescue false
  end
end

class String
  def to_slug
    Babosa::SlugString.new self
  end

  # Compatibility with 1.8.6
  if !public_method_defined? :bytesize
    def bytesize
      unpack("C*").length
    end
  end
end

require "babosa/characters"
require "babosa/utf8/proxy"
require "babosa/slug_string"
