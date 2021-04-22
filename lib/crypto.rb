require 'rubygems'
require 'nokogiri'
require 'open-uri'

@page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))


# Dark Trader 

# Récupère les colonnes 1 et 3 et grâce à .map do cela les met au format de liste pour
# qu'elles soient dans un array

def path
  crypto_currencieS_valueS = @page.xpath('//td[3] | //td[5]').map do |crypto| 
    crypto.content.tr('$','') #pour remplacer la valeur $ par un espace
  end
end

# Création d'un array
def scrap(crypto_currencieS_valueS)
  i = 0
  array =[]
  while crypto_currencieS_valueS[i] != nil do #continuer à boucler jusqu'à ce que ce ne soit pas nul
  array << Hash[crypto_currencieS_valueS[i],crypto_currencieS_valueS[i+1]] #mise du hash dans un array
    i = i + 2
  end
  return array
end


puts scrap(path)














