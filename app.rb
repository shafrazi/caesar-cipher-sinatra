class CaesarCipherApp < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get "/" do
    string = params[:string]
    shift = params[:shift].to_i
    if string
      @encoded_string = caesar_cipher(string, shift)
    end
    erb :index
  end
end

def caesar_cipher(string, shift)
  array = string.split("")
  new_array = []
  array.each do |letter|
    if ("a".."z").include?(letter) || ("A".."Z").include?(letter)
      if letter.upcase == letter
        n = letter.ord + shift
        if n > 90
          n = ((letter.ord + shift) - 90) + 64
        end
      else
        n = letter.ord + shift
        if n > 122
          n = ((letter.ord + shift) - 122) + 96
        end
      end
      new_array << n.chr
    else
      new_array << letter
    end
  end
  new_array.join("")
end
