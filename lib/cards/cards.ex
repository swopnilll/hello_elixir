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
    values = [
     "Ace", "2", "3", "4", "5", "6", "7",
      "8", "9", "10", "Jack", "Queen", "King"
      ]
    suits = ["Spades", "Hearts", "Diamond", "Clubs"]

    for value <- values, suit <- suits do
      "#{value} #{suit}"
    end

  end

  # Check if deck contains a card
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  # Method to return a deal. Returns a tuple.
  def deal(deck, number_of_cards) do
    Enum.split(deck, number_of_cards)
  end

  def shuffle (deck) do
    Enum.shuffle(deck)
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def load(filename) do
    # File.read(filename)
    # {:ok, <<131, 108,.... >>}
    # {:error, :enoent}
    # File.read(filename)

    # {status, binary} = HelloElixir.Cards.load("my_deck")
    # status = :ok
    # binary = <<131, 108,.... >>

    # {status, binary} = File.read(filename)

    # case status do
    #   :ok -> :erlang.binary_to_term(binary)
    #   :error -> "File not found"
    # end

    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _reason} -> "That file does not exist"
    end

  end


end
