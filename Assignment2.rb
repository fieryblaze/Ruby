# Part 1: Classes
# 1a Dessert
class Dessert
	def initialize(name, calories)
		@name = name
		@calories = calories
	end
	
	def healthy?
		if(@calories < 200)
			return true
		else
			return false
		end
	end
	
	def delicious?
		return true
	end
end
	
dh = Dessert.new("healthy", 150)
dunh = Dessert.new("unhealthy", 230)
puts dh.healthy?
puts dunh.healthy?
	
# 1b JellyBean
class JellyBean < Dessert
	def initialize(name, calories, flavor)
		super(name, calories)
		@flavor = flavor
	end
	
	def delicious?
		if @flavor == "black licorice"
			return false
		else
			super
		end
	end
end

bl = JellyBean.new("jelly belly", 150, "black licorice")
nbl = JellyBean.new("jelly belly", 150, "cherry")
puts bl.delicious?
puts nbl.delicious?

# Part 2: OOP
class Class
	def attr_accessor_with_history(attr_name)
		attr_name = attr_name.to_s
		attr_reader attr_name
		attr_reader attr_name+"_history"
		class_eval %Q(
			@#{attr_name+"_history"} = []
			def #{attr_name}=(val)
				@#{attr_name}=val
				if @#{attr_name+"_history"} == nil
					@#{attr_name+"_history"} = [nil]
				end
				@#{attr_name+"_history"}.push(val)
			end)
	end
end

class Foo
	attr_accessor_with_history :bar
end

f = Foo.new
print f.bar_history
f.bar = 3
f = Foo.new
f.bar = 1
f.bar = 2
print f.bar_history
print "\n"

# Part 3
# 3a
class Numeric
	@@currencies = {'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019, 'dollar' => 1}
	
	#def dollars ; self ; end
	#def euros ; self / 1.292 ; end
	def method_missing(method_id, *args)
		singular_currency = method_id.to_s.gsub(/s$/,'')
		if @@currencies.has_key?(singular_currency)
			self / @@currencies[singular_currency]
		else
			super
		end
	end
	
	def in(method_id)
		singular_currency = method_id.to_s.gsub(/s$/,'')
		if @@currencies.has_key?(singular_currency)
			((self * @@currencies[singular_currency])*1000).to_i/1000.0
		else
			super
		end
	end
end

puts 1.dollar.in(:rupees)
puts 10.rupees.in(:euro)

# 3b

