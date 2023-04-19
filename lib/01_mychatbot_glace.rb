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
  
  data = {
    "prompt" => "five ice-cream flavors",#text qui est entré dans IA sur laquelle on est branché
    "max_tokens" => 13,
    "n" => 1, # Ce paramètre détermine le nombre de réponses différentes que le modèle doit générer pour un même texte d'entrée (prompt)
    "temperature" => 0.2
    }

  response = HTTP.post(url, headers: headers, body: data.to_json)
  response_body = JSON.parse(response.body.to_s)
  response_string = response_body['choices'][0]['text'].strip

  # ligne qui permet d'envoyer l'information sur ton terminal
  puts "Voici 5 parfums de glace :"
  puts response_string
end 

perform
