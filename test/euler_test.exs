defmodule EulerTest do
  use ExUnit.Case
  doctest Euler

  test "greets the world" do
    assert Euler.hello() == :world
  end


  # Michael's Implementations
  test "sums multiples of 3 and 5 to 1_000" do
    assert Euler1To10.three_or_five(999) == 233_168
  end

  test "sums even fibonnaci sequence for numbers <= 4_000_000" do
    assert Euler1To10.even_fibonacci() === 4_613_732
  end

  test "Get largest prime from number" do
    assert Euler1To10.largest_prime(600_851_475_143) === 6857
  end
end
