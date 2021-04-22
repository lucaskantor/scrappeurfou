def townhall_url

  @phonebook = Nokogiri::HTML(URI.open('https://www.annuaire-des-mairies.com/val-d-oise.html'))
  mairie = @phonebook.xpath('//*[@class="lientxt"]/@href').map do |i|
    i.text
  end
end
puts townhall_url

def get_townhall_email(townhall_url)
@page = Nokogiri::HTML(URI.open('https://www.annuaire-des-mairies.com/95/avernes.html'))
townhall_email = @page.xpath('//section[2]/div/table/tbody/tr[4]/td[2]').map do |i|
    i.text
  
  end
end
  puts get_townhall_email(@page)