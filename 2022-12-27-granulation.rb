use_bpm 120

# Set the grain size, rate, and number of grains
grain_size = 0.1
grain_rate = 8
num_grains = 8

# Set the source sample and start and end points
sample_name =
  start_point = 0
end_point = 0.5

# Set the main envelope for the granulation effect
gran_attack = 0.01
gran_decay = 0.1
gran_sustain = 0.9
gran_release = 0.1

# Create a live loop to continuously apply the granulation effect
live_loop :granulation do
  # Set the envelope for the current grain
  grain_attack = rrand(0, gran_attack)
  grain_decay = rrand(0, gran_decay)
  grain_sustain = rrand(0, gran_sustain)
  grain_release = rrand(0, gran_release)
  
  # Use the envelope to control the volume of the grain
  with_fx :ixi_techno, attack: grain_attack, decay: grain_decay, sustain: grain_sustain, release: grain_release do
    ##| with_fx :flanger, attack: grain_attack, decay: grain_decay, sustain: grain_sustain, release: grain_release do
    # Set the pitch and pan of the grain
    grain_pitch = rrand(-1, 1)
    grain_pan = rrand(-1, 1)
    
    # Play the grain with the specified pitch and pan
    sample :loop_breakbeat, rate: grain_rate, start: start_point, finish: end_point, pan: grain_pan, pitch: grain_pitch, amp: 0.5
  end
  
  # Sleep for the length of the grain size
  sleep grain_size
end
