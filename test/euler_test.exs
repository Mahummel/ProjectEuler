defmodule EulerTest do
  use ExUnit.Case
  doctest Euler

  # Michael's Implementations
  test "sums multiples of 3 and 5 to 1_000" do
    assert Euler.Multiples.solve() == 233_168
  end

  test "sums even fibonnaci sequence for numbers <= 4_000_000" do
    assert Euler.Fibonacci.solve() === 4_613_732
  end

  test "Get largest prime from number" do
    assert Euler.LargestPrime.solve() === 6857
  end

  test "Palindrone creation" do
    assert Euler.Palindrone.solve() === 906609
  end

  test "Smallest Multiple" do
    assert Euler.SmallestMultiple.solve() === 232792560
  end

  test "Sum Square Difference" do
    assert Euler.SumSquareDifference.solve() === 25164150
  end

  test "Get Numbered Prime" do
    assert Euler.GetNumberedPrime.solve() === 104743
  end

  test "Largest Product in Series" do
    assert Euler.LargestProductInSeries.solve() === 23514624000
  end

  test "Pythagorean Triplets" do
    assert Euler.PythagoreanTriplet.solve() === 31875000
  end
end
