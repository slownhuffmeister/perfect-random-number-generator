require 'net/http'

module PerfectRandom
	extend self
	M = 2**32
	A = 1664525
	C = 1013904223
	@cur_val = 0

	def seed min=0, max=100000
		begin
			@cur_val  = Net::HTTP.get('www.random.org', "/integers/?num=1&min=#{min}&max=#{max}&col=1&base=10&format=plain&rnd=new").chomp.to_i
		rescue Net::HTTPFatalError => e
			puts e
		end
	end

	def rand 
		@cur_val = (A*@cur_val + C)%M
	end
end

PerfectRandom::seed
puts PerfectRandom::rand
puts PerfectRandom::rand
puts PerfectRandom::rand