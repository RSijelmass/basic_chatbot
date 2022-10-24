class Chatbot
  DEFAULT_VALUE = "Ouch, I'm going to need a little more. Maybe try 'see my bills'?\nIf you want to stop this, just say 'exit'".freeze
  RESPONSE_INCLUDE_HASH = {
    'can i afford' => "If you have to ask, it's probably a no",
    'bills' => "Uber: $55\nMcDonalds: $16.50\nAmazon: $79.99\n\nThat's looking like a big week.",
    'stress' => "I feel you, it's a stressful time. Make sure to take care of yourself ❤️",
    'thanks' => "you're welcome :)",
  }.freeze
  RESPONSE_REGEX_HASH = {
    /^(hey|hello|hi|bonjour|hi)( cleo)?$/ => 'and a hello to you too',
    /(thanks|thankyou|thank you)/ => 'you got it champion 🏆',
    /^(\$|£)\d{1,3}\.?\d{,2} (move )?(in|to|into) (my )?(cleo )?wallet$/ => 'moving that for you - you\'re doing great',
  }.freeze
  
  def call
    puts 'Well hi stranger! Anything I can help with?'
    user_request = nil

    while user_request != 'exit' do 
      user_request = gets.chomp

      response_value = attempt_include_fetch(user_request)
      response_value = attempt_regex_fetch(user_request) if response_value.nil?
      response_value = DEFAULT_VALUE if response_value.nil?
        
      puts response_value
    end
  end

  def attempt_include_fetch(user_request)
    response_key = RESPONSE_INCLUDE_HASH.keys.find { |key| user_request&.downcase&.include? key }
    return unless response_key

    RESPONSE_INCLUDE_HASH[response_key]
  end

  def attempt_regex_fetch(user_request)
    RESPONSE_REGEX_HASH.find { |key, value| break value if user_request.match(key) }
  end
end

Chatbot.new.call