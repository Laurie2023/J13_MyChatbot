def login_openai 
  require 'http'
  require 'dotenv'

  Dotenv.load('.env')

  api_key = ENV["OPENAI_API_KEY"]
  url = "https://api.openai.com/v1/models"
  headers = {
    "Content-Type" => "application/json",
    "Authorization" => "Bearer #{api_key}"
  }

  response = HTTP.get(url, headers: headers)
  return response
end 

def perform()
  require 'dotenv'
  require 'http'
  require 'json'

  Dotenv.load('.env')

  api_key = ENV["OPENAI_API_KEY"]
  url = "https://api.openai.com/v1/engines/text-babbage-001/completions"

  headers = {
    "Content-Type" => "application/json",
    "Authorization" => "Bearer #{api_key}"
  }
  
  conversation_history=[]

  # demande à l'utilisateur ce qu'il recherche
  puts "What information do you want to find? (stop to finish the research)"
  puts ""

  loop do #mise en place d'une boucle
    print "Vous : "
    api_key = gets.chomp.to_s
    conversation_history << api_key

    recherche = conversation_history.join(" ").to_s

    if api_key == 'stop'
      break
    end

    data = {
      "prompt" => recherche,#text qui est entré dans IA sur laquelle on est branché
      "max_tokens" => 90,
      "n" => 1, # Ce paramètre détermine le nombre de réponses différentes que le modèle doit générer pour un même texte d'entrée (prompt)
      "temperature" => 0.2
      }

    response = HTTP.post(url, headers: headers, body: data.to_json)
    response_body = JSON.parse(response.body.to_s)
    response_string = response_body['choices'][0]['text'].strip

    # ligne qui permet d'envoyer l'information sur ton terminal
    print "IA : "
    puts response_string
  end 
end 

perform
