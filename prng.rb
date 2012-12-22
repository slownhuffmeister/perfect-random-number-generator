require 'uri'
require 'net/http'

module RandomOrg
	class Integer
		def initialize(min, max)
			begin
				res = Net::HTTP.get('www.random.org', "/integers/?num=1&min=#{min}&max=#{max}&col=1&base=10&format=plain&rnd=new").chomp
				@value = res.to_i
			rescue Net::HTTPFatalError => e
				puts "Error: " + e
			end
		end
		def to_i
			@value
		end
	end
end
