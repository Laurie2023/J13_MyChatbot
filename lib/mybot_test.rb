
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
  # lignes très importantes qui appellent les gems et le Dotenv.
  require 'dotenv'
  require 'http'
  require 'json'

  Dotenv.load('.env')

  # création de la clé d'api et indication de l'url utilisée.
  api_key = ENV["OPENAI_API_KEY"]
  url = "https://api.openai.com/v1/engines/text-babbage-001/completions"

  # un peu de json pour faire la demande d'autorisation d'utilisation à l'api OpenAI
  headers = {
    "Content-Type" => "application/json",
    "Authorization" => "Bearer #{api_key}"
  }
  
  # un peu de json pour envoyer des informations directement à l'API
  data = {
    "prompt" => "5 parfums de glaces",#text qui est entré dans IA sur laquelle on est branché
    "max_tokens" => 50,
    "n" => 1, # Ce paramètre détermine le nombre de réponses différentes que le modèle doit générer pour un même texte d'entrée (prompt)
    "temperature" => 0.1
    }

  # une partie un peu plus complexe :
  # - cela permet d'envoyer les informations en json à ton url
  # - puis de récupéré la réponse puis de séléctionner spécifiquement le texte rendu
  response = HTTP.post(url, headers: headers, body: data.to_json)
  response_body = JSON.parse(response.body.to_s)
  response_string = response_body['choices'][0]['text'].strip

  # ligne qui permet d'envoyer l'information sur ton terminal
  puts "Voici 5 parfums de glace :"
  puts response_string
end 

perform
