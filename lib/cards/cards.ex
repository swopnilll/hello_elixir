defmodule HelloElixir.Cards do
  # HelloElixir.Cards.create_deck
  # ["Ace", "One", "Two", "Three"]
  def create_deck do
    values = ["Ace", "One", "Two", "Three"]
    suits = ["Spades", "Hearts", "Diamond", "Clubs"]

    for value <- values do
      value
    end
  end

  # HelloElixir.Cards.create_deck2
  #   [
  #     ["Spades - Ace", "Spades - One", "Spades - Two", "Spades - Three"],
  #     ["Hearts - Ace", "Hearts - One", "Hearts - Two", "Hearts - Three"],
  #     ["Diamond - Ace", "Diamond - One", "Diamond - Two", "Diamond - Three"],
  #     ["Clubs - Ace", "Clubs - One", "Clubs - Two", "Clubs - Three"]
  #   ]

  # Problem: Not getting String of List

  def create_deck2 do
    values = ["Ace", "One", "Two", "Three"]
    suits = ["Spades", "Hearts", "Diamond", "Clubs"]

    for suit <- suits do
      for value <- values do
        "#{suit} - #{value}"
      end
    end
  end

  def create_deck3 do
    values = ["Ace", "One", "Two", "Three"]
    suits = ["Spades", "Hearts", "Diamond", "Clubs"]

    decks =
      for suit <- suits do
        for value <- values do
          "#{suit} - #{value}"
        end
      end

    List.flatten(decks)
  end

  def create_deck4 do
    values = ["Ace", "One", "Two", "Three"]
    suits = ["Spades", "Hearts", "Diamond", "Clubs"]

    for value <- values, suit <- suits do
      "#{value} #{suit}"
    end

  end
end
