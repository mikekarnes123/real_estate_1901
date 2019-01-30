require 'minitest/autorun'
require 'minitest/pride'
require './lib/room'
require './lib/house'

class HouseTest < Minitest::Test
  def setup
    @house = House.new("$400000", "123 sugar lane")
    @room_1 = Room.new(:bedroom, 10, 13)
    @room_2 = Room.new(:bedroom, 11, 15)
    @room_3 = Room.new(:living_room, 25, 15)
    @room_4 = Room.new(:basement, 30, 41)
  end
  def test_house_exists
    assert_instance_of House, @house
  end
  def test_it_has_attributes
    assert_equal "$400000", @house.price
    assert_equal "123 sugar lane", @house.address
  end
  def test_has_no_rooms
    assert_equal [], @house.rooms
  end
  def test_can_add_rooms
    @house.add_room(@room_1)
    @house.add_room(@room_2)
    assert @house.rooms.length == 2
  end
  def test_rooms_from_category
    @house.add_room(@room_1)
    @house.add_room(@room_2)
    @house.add_room(@room_3)
    @house.add_room(@room_4)
    assert @house.rooms_from_category(:bedroom).length == 2
    assert @house.rooms_from_category(:basement).length == 1
    assert @house.rooms_from_category(:living_room).length == 1
  end
  def test_price_per_square_foot
    @house.add_room(@room_1)
    @house.add_room(@room_2)
    @house.add_room(@room_3)
    @house.add_room(@room_4)
    assert_equal 210.53, @house.price_per_square_foot
  end
  def test_rooms_sorted_by_area
    @house.add_room(@room_1)
    @house.add_room(@room_2)
    @house.add_room(@room_3)
    @house.add_room(@room_4)

    @house.rooms_sorted_by_area

  end
end
