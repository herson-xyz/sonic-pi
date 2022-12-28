use_bpm 120

# Define a Markov chain for generating notes
@markov_chain = [
  {
    :bd_haus => 0.5,
    :bd_boom => 0.5
  },
  {
    :bd_haus => 0.7,
    :bd_boom => 0.2,
    :bd_fat => 0.1
  },
  {
    :bd_haus => 0.4,
    :bd_boom => 0.3,
    :bd_fat => 0.3
  }
]

# Generate a sequence of notes using the Markov chain
live_loop :markov do
  # Select a starting state at random
  state = rand_i(3)
  # Generate a sequence of notes
  64.times do
    # Select a new state based on the probabilities in the current state
    new_state = (rrand 0.0, 1.0)
    if new_state <= @markov_chain[state][:bd_haus]
      sample :bd_haus
      state = 0
    elsif new_state <= @markov_chain[state][:bd_haus] + @markov_chain[state][:bd_boom]
      sample :bd_boom
      state = 1
    else
      sample :bd_fat
      state = 2
    end
    sleep 0.1
  end
end
