class LinkedList
	attr_reader :size

	def initialize
		@head = nil
		@tail = nil
		@size = 0

	end

	def append(value)
		node = Node.new(value)
		@size += 1

		if @head.nil?
			@head = node
			@tail = @head
		else
			@tail.next = node
			@tail = @tail.next
		end
	end

	def prepend(value)
		node = Node.new(value)
		@size += 1

		if @head.nil?
			@head = node
			@tail = @head
		else
			node.next = head
			@head = node
		end
	end

	def size
		@size
	end

	def head
		@head.value
	end

	def tail
		@tail.value
	end

	def at(index)

		if index == 0
			@head.value
		else
			node = @head
			index.times do
				node = node.next
			end
			node.value
		end
	end

	def pop
		@size -= 1

		node = @head
		until node.next == @tail
			node = node.next
		end
		@tail = node
		@tail.next = nil
	end

	def contains?(value)
		node = @head

		until node == @tail.next
			if node.value == value
				return true
			else node = node.next
			end
		end
		false
	end


end

class Node

	attr_accessor :value, :next

	def initialize(value)
		@value = value
		@next = nil
	end
end

a = LinkedList.new


b = a.append("hi")
c = a.append("bye")
d = a.append("shy")
e = a.append("4")
f = a.append("5")
g = a.append("6")

p a.contains?("7")
p a.size

