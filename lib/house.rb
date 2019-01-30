
class House
  attr_reader :price,
              :address,
              :rooms
  def initialize(price, address)
    @price = price
    @address = address
    @rooms = []
  end

  def add_room(room)
    @rooms << room
  end

  def rooms_from_category(category)
    @rooms.find_all{|room|
      room.category == category
    }

  end

  def price_per_square_foot
  sq_ft =  @rooms.inject(0){|num, room|
    num = num + room.area
    }

    (@price.delete("$").to_i.to_f/sq_ft).round(2)
  end

  def rooms_sorted_by_area
  rooms_ordered_by_area = []
  room_array = @rooms
    @rooms.length.times{
      next_smallest = room_array.find {|room|
        (0..10000000)
        }
        require 'pry'; binding.pry

      rooms_sorted_by_area << next_smallest
      room_array.delete!(next_smallest)
    }



    # sq_ft_array = @rooms.map {|room|
    #   room.area
    # }
    # ordered_arrays = []
    # sq_ft_array.each_cons(2){|first, second|
    # if first < second
    #   ordered_arrays << first; second
    # end
    # }
    # return ordered_arrays
  end
end
