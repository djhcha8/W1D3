require "byebug"

def range(min,max)
  return [] if min >= max
  range(min,max - 1) << max - 1
end

def sum_iterative(arr)
  sum = arr.first
  arr[1..-1].each do |num|
    sum += num
  end
  sum
end

def sum_recursive(arr)
  return 0 if arr.empty?
  
  arr.first + sum_recursive(arr[1..-1])
end

def exp1(base,n)
  return 1 if n == 0
  
  base * exp1(base,n-1)
end

def exp2(base,n)
  return 1 if n == 0
  
  half = n/2
  
  if n.even?
    exp2(base,half) * exp2(base,half)
  else
    base * exp2(base,half) * exp2(base,half)
  end
end

class Array
  def deep_dup

    result = []
    
    self.each do |el|
      if el.is_a?(Array)
        result << el.deep_dup
      else
        result << el
      end
      
    end
    result
  end
end

def iterative_fib(n)
  return [0] if n == 1
  return [1] if n == 2
  
  fibs = [0,1]
  
  while n > fibs.length
    fibs << fibs[-2] + fibs[-1]
  end
  
  fibs
end

def recursive_fib(n)
  return [0,1].take(n) if n <= 2
  
  previous_fibs = recursive_fib(n - 1)
  previous_fibs << previous_fibs[-1] + previous_fibs[-2]
end

def subsets(arr)
  # debugger
  return [[]] if arr.empty?
  # result = []
  
  sub_sets = subsets(arr[0..-2])
  add_sets = sub_sets.map do |subset|
    subset + [arr.last]
  end
    
  sub_sets += add_sets
  sub_sets
end

def permutations(arr)
  # debugger
  return [arr] if arr.length == 1
  result = []
  
  prev_perm = permutations(arr[0..-2])
  prev_perm.each do |array|
    result += add_to_indices(array, arr.last)
  end
  
  
  # new_perm = (0..prev_perm.length).map do |idx|
  #   # debugger
  #   if prev_perm[idx].is_a?(Array)
  #     (0..prev_perm[idx].length).map do |idx1|
  #       prev_perm[idx].dup.insert(idx1, arr.last)
  #     end
  #     # return
  #   else
  #     prev_perm.dup.insert(idx, arr.last)
  #   end
  # end
  
  return result.sort
  
end

def add_to_indices(arr, num)
  (0..arr.length).map do |idx|
    arr.dup.insert(idx, num)
  end
end

def bsearch(array, target)
  return nil if array.empty?
  
  
end  