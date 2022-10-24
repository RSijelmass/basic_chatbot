response_hash = {
  'can i afford' => "If you have to ask, it's probably a no",
  'bills' => "Uber: $55\nMcDonalds: $16.50\nAmazon: $79.99\n\nThat's looking like a big week.",
  'stress' => "I feel you, it's a stressful time. Make sure to take care of yourself ❤️",
  'thanks' => "you're welcome :)",
}

user_request = nil
default_value = "Ouch, I'm going to need a little more. Maybe try 'see my bills'?\nIf you want to stop this, just say 'exit'"

puts 'Well hi stranger! Anything I can help with?'

while user_request != 'exit' do 
  user_request = gets.chomp

  response_key = response_hash.keys.find { |key| user_request&.downcase&.include? key }
  response_value = response_key.nil? ? default_value : response_hash[response_key]
  puts response_value
end