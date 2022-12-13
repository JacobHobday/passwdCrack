#ReadMe
#To install digest we need to use the gem command in linux
#$ gem install digest

require "digest"

args = ARGV
method = ARGV[0]
methodParameter = ARGV[1]
hashlist = ARGV[2]

help = "$passwdcrack.rb [method (-w or -b)] [methodParameter (plaintext password file)] [hashlist]"

def hash(valueToHash)
var = Digest::MD5.hexidigest(valueToHash)
return var
end

def main(args, method, methodParameter, hashlist)

if (args.length != 3)
	puts(help)
end

case method
when "-h"
	puts(help)

when "-w"
	puts "Dictionary selected."
	wordlist(method, methodParameter, hashlist)
	
when "-b"
	puts "Bruteforce selected."
	bruteforce(method, methodParameter, hashlist)
end
end

def wordlist(method, methodParameter, hashlist)
	File.foreach(methodParameter) do |lines| 
	lineChomp = lines.chomp
	retHash = hash(lineChomp)
	sleep(1)
	puts "outer loop: " + retHash + " original: " + lines
	File.foreach(hashlist) do |hashes|
	hashWord = hashes.chomp
	sleep(1)
	puts "inner loop: " + hashWord
	if(retHash == hashWord)
		puts retHash + " *match!"
	break
	end
	end
end
end

def bruteforce(method, methodParameter, hashlist)
characters = "abcdefghijklmnopqrstuvwxyz" 
charSplit = characters.split('')
indexStart = charSplit[0]
indexEnd = charSplit[-1]
len = charSplit.length
methodParameter = methodParameter.to_i

puts charSplit
puts len
if (indexStart == indexEnd)
	return charSplit
else
end
end
