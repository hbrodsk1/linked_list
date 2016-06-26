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

	def find(value)
		index = 0
		node = @head

		until node == @tail.next
			if node.value == value
				return index
			else
			node = node.next
			index += 1
			end
		end
		nil
	end

	def to_s
		node = @head

		until node == @tail.next
			print "(#{node.value}) -> "
			node = node.next
		end
		nil
	end

	def insert_at(index)
		@size += 1
		node = @head
		new_node = Node.new("No Data")
		count = 0

		until count == index - 1 
			node = node.next
			count += 1
		end
		insert = node.next
		node.next = new_node
		new_node.next = insert

		@tail = node.next if index == @size
	end

	def remove_at(index)
		@size -= 1
		node = @head
		count = 0

		if index == 0
			new_head = @head.next
			@head = new_head
		else
			until count == index - 1
				node = node.next
				count += 1
			end
		end

		node.next = node.next.next
	end
end

class Node

	attr_accessor :value, :next

	def initialize(value)
		@value = value
		@next = nil
	end
end