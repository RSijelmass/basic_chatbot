response_hash = {
  'can i afford' => "If you have to ask, it's probably a no",
  'bills' => "Your bills of the week: they're not looking good",
  'stress' => "I feel you, it's a stressful time. Make sure to take care of yourself ❤️"
}

answer = nil
default_value = "Ah honey, I'm going to need a little more than that. Try something like 'see my bills'.\nIf you want to stop this dance, just say 'exit'"

puts 'Well hi stranger! Anything I can help with?'

while answer != 'exit' do 
  answer = gets.chomp

  response_key = response_hash.keys.find { |x| answer&.downcase&.include? x }
  response_value = response_key.nil? ? default_value : response_hash[response_key]
  puts response_value
endz