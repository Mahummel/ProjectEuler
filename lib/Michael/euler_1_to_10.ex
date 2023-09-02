defmodule Euler.Multiples do
  @moduledoc false

  @doc """
    Question 1
    we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3,5,6, and 9.
    The sum of these multiples is 23.

    Find the sum of all the multiples of 3 or 5 below 1000.

  ## Examples

      iex> Euler.Multiples.solve()
      233168

  """
  @spec solve(non_neg_integer, non_neg_integer) :: non_neg_integer
  def solve(n \\ 999, sum \\ 0)
  def solve(0, sum), do: sum
  def solve(n, sum) do
    if n > 0 and (rem(n, 5) == 0 or rem(n, 3) == 0) do
      solve(n - 1, sum + n)
    else
      solve(n - 1, sum)
    end
  end
end

defmodule Euler.Fibonacci do
  @moduledoc false

  @doc """
    Question 2
    Each new term in the Fibonacci sequence is generated by adding the previous two terms.
    By starting with 1 and 2  the first 10 terms will be:

    1,2,3,5,8,13,21,34,55,89,...

    By considering the terms in the Fibonacci sequence whose values do not exceed four million,
    find the sum of the even-valued terms.

  ## Examples

      iex> Euler.Fibonacci.solve()
      233168

  """
  @spec solve(non_neg_integer(), non_neg_integer(), non_neg_integer()) :: non_neg_integer
  def solve(current \\ 2, previous \\ 1, sum \\ 0)

  def solve(current, previous, sum) do
    cond do
      rem(current, 2) == 0 and current < 4_000_000 ->
        solve(current + previous, current, sum + current)

      current < 4_000_000 ->
        solve(current + previous, current, sum)

      rem(current, 2) == 0 and current == 4_000_000 ->
        sum + current

      current >= 4_000_000 ->
        sum
    end
  end
end

defmodule Euler.LargestPrime do
  @moduledoc false

  @doc """
    Question 3
    The prime factors of 13195 are 5,7,13 and 29.

    What is the largest prime factor of the number 600_851_475_143?

    ## Examples

    iex> Euler.LargestPrime.solve()
    6857
  """
  @spec solve(non_neg_integer) :: non_neg_integer
  def solve(n \\ 600_851_475_143) do
    n
    |> :math.sqrt()
    |> trunc()
    |> (&(&1..2)).()
    |> Enum.filter(&(rem(n, &1) == 0 && check_prime(&1)))
    |> Enum.take(1)
    |> hd()
  end

  defp check_prime(x) do
    2..(x - 1) |> Enum.all?(&(rem(x, &1) != 0))
  end
end

defmodule Euler.Palindrone do
  @moduledoc false

  @doc """
    Question 4
    A palindromic number reads the same both ways. The largest palindrome made from the
    product of two 2-digit numbers is 9009 = 91 x 99.

    Find the largest palindrome made from the product of two 3-digit numbers.

    ## Examples

    iex> Euler.Palindrone.solve()
    906609
  """
  def solve() do
    for x <- 999..900, y <- 999..900, x > y do
      (x * y)
      |> Integer.to_string()
      |> check_string
      |> Enum.all?(&(&1 === true)) && x * y
    end
    |> Enum.filter(&(&1 !== false))
    |> hd()
  end

  defp check_string(string) do
    length = string |> String.length() |> (&(&1 / 2)).() |> trunc()

    for x <- 0..(length - 1) do
      String.at(string, x) === String.at(string, String.length(string) - (x + 1))
    end
  end
end

defmodule Euler.SmallestMultiple do
  @moduledoc false

  @doc """
    Question 5
    2520 is the smallest number that can be divided by each of the numbers from
    1 to 10 without any remainder.

    What is the smallest positive number that is evenly divisible by all of the
    numbers from 1 to 20?

    ## Examples

    iex> Euler.SmallestMultiple.solve()
    232792560
  """
  def solve(num \\ 20) do
    20..11
    |> Enum.all?(&(rem(num, &1) === 0))
    |> (&(if (&1) do num else solve(num + 20) end)).()
  end
end
