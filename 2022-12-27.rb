# Source https://discord.com/channels/696772407154835537/704076430593753128/793444798404100097

use_debug false
use_bpm 70
define :fakechain do |v|
  at (0..8).to_a do |t|
    at 0.0 do
      control v, amp: 0.2, amp_slide: 0.1
    end
    at 0.2 do
      control v, amp: 1, amp_slide: 0.2
    end
    at 0.8 do
      control v, amp: 0.2, amp_slide: 0.2
    end
  end
end
live_loop :stuff do
  with_fx :level do |c|
    sample :ambi_swoosh, amp: 0.7, start: 0.1, rate: 1.4,
      ##sample :guit_e_fifths, amp: 0.6, start: 0.05, rate: [1,2,1,1].tick
      fakechain(c)
  end
  sleep 1
end
