require 'net/http'

module PerfectRandom
	extend self
	M = 2**32
	A = 1664525
	C = 1013904223
	@val = 0
	@seeded = false

	def seed min=0, max=100000
		begin
			@val  = Net::HTTP.get('www.random.org', "/integers/?num=1&min=#{min}&max=#{max}&col=1&base=10&format=plain&rnd=new").chomp.to_i
			@seeded = true
		rescue Net::HTTPFatalError => e
			puts e
		end
	end

	def rand 
		seed if not @seeded
		@val = (A*@val + C)%M
	end

	def method_missing *args
		puts "Slown is perfect!"
	end
	private :seed
end

puts PerfectRandom::rand
puts PerfectRandom::rand
puts PerfectRandom::rand